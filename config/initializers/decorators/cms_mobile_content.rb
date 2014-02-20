Cms::ContentController.class_eval do
  def show
    if @cms_page.target_page.present?
      redirect_to @cms_page.target_page.url
    else
      respond_with(@cms_page) do |format|
        format.html { render_html }
	format.mobile { render_mobile }
      end
    end
  end
  
  protected
  
    def render_mobile(status = 200)
      if @cms_layout = @cms_page.layout
	app_layout = (@cms_layout.app_layout.blank? || request.xhr?) ? false : @cms_layout.app_layout
	if !ComfortableMexicanSofa.config.enable_conditional_get_support || stale?(:etag => flash.to_hash, :last_modified => @cms_page.site.updated_at)
	  text = render_to_string :inline => @cms_page.content
	  text = Nokogiri::HTML(text)
	  text.search('div#body-content>div.row>div.col-sm-4').remove
	  text.search('div#body-content>div.row>div.col-md-7 div.row>div.col-xs-2').remove
	  render :inline => text.inner_html, :layout => app_layout, :status => status, :content_type => 'text/html'
	else
	  flash.clear
	end
      else
	render :text => I18n.t('cms.content.layout_not_found'), :status => 404
      end
    end

end