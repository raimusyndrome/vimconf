
if      ComputerName() == g:work_note 
    set columns=150
    set lines=45
elseif  ComputerName() == g:work_desk
    set columns=150
    set lines=60
elseif  ComputerName() == g:work_worksta
    set columns=180
    set lines=60
endif

