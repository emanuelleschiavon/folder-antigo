class DocumentsController < ApplicationController

	def index
		documents = Document.all
		render json: {status: 'SUCCESS', message: 'Loaded documents', data: documents}, status: :ok
	end

	def show
		document = Document.find(params[:id])
		render json: {status: 'SUCCESS', message: 'Loaded document', data: document}, status: :ok
	end

	def create
		document = Document.new(document_params)
		if document.save
			render json:{status: 'SUCCESS', message: 'Saved document', data: document}, status: :ok
		else
			render json:{status: 'ERROR', message: 'Document not saved', data: document.erros}, status: :unprocessable_entity
		end
	end

	def destroy
		document = Document.find(params[:id])
		document.destroy
		render json: {status: 'SUCCESS', message: 'Deleted document', data: document}, status: :ok
	end

	def update
		document = Document.find(params[:id])
		if document.update_attributes(document_params)
			render json:{status: 'SUCCESS', message: 'Updated document', data: document}, status: :ok
		else
			render json:{status: 'ERROR', message: 'Document not updated', data: document.erros}, status: :unprocessable_entity
		end
	end

	private

	def document_params
		params.permit(:title, :content)
		byebug
	end

end