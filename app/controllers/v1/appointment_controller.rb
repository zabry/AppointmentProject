class V1::AppointmentController < ApplicationController
    def index
        appointments = Appointment.all
        render json: {result: 'DONE', message: 'List of Appoinments', data: appointments}, status: :ok
    end

    def show

        appointments = Appointment.find(params[:id])
        render json: {result: 'FOUND', message: 'List of Appoinments', data: appointments}, status: :ok

    end


    def create
        appointments = Appointment.new(appoinment_params)
        
        if appointments.save
            render json: {result: 'SAVED', message: 'Saved Appoinments', data: appointments}, status: :ok
        else
            render json: {result: 'OOPS', message: 'Not Saved!!!', data: appointments.error}, status: :unprocessable_entity
        end

    end

    def destroy

        appointments = Appointment.find(params[:id])
        appointments.destroy
        render json: {result: 'DELETED', message: 'Deleted Appoinment', data: appointments}, status: :ok
    end

    def update
        appointments = Appointment.find(params[:id])
        if appointments.update(appoinment_params)
            render json: {result: 'Updated', message: 'Updated Appoinments', data: appointments}, status: :ok
        else
            render json: {result: 'OOPS', message: 'Not Updated!!!', data: appointments.error}, status: :unprocessable_entity
        end


    end


    private

    def appoinment_params
        params.permit(:patient_name, :doctor_name, :medical_history)
    end


end
