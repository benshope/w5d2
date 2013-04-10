module CommentsHelper
  def render_children(comments, id)
    comments.each do |comment|
      if comment.parent == id

      end
    end
  end
end
