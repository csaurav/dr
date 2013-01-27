module HomeHelper
	def dr_link_to (label, domain_id)
		status = Status.find_by_name label
		link_to "#{status.name.capitalize}", assign_tag_domain_path(:id =>domain_id, :status => status.id), 
		:method => 'post' ,:class => 'btn btn-mini btn-primary'
	end

	def show_link (domain)
        domain.tag.status.name == t('hide') ? t('like') : t('hide')
	end
end
