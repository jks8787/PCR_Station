module ApplicationHelper

def current_user_has_article_saved?(article)
	user_signed_in? && current_user.articles.include?(Article.find(article.id))
end

end
