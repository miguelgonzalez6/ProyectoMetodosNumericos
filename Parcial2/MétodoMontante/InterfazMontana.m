function varargout = InterfazMontana(varargin)
% INTERFAZMONTANA MATLAB code for InterfazMontana.fig
%      INTERFAZMONTANA, by itself, creates a new INTERFAZMONTANA or raises the existing
%      singleton*.
%
%      H = INTERFAZMONTANA returns the handle to a new INTERFAZMONTANA or the handle to
%      the existing singleton*.
%
%      INTERFAZMONTANA('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in INTERFAZMONTANA.M with the given input arguments.
%
%      INTERFAZMONTANA('Property','Value',...) creates a new INTERFAZMONTANA or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before InterfazMontana_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to InterfazMontana_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help InterfazMontana

% Last Modified by GUIDE v2.5 25-Oct-2016 19:40:47

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @InterfazMontana_OpeningFcn, ...
                   'gui_OutputFcn',  @InterfazMontana_OutputFcn, ...
                   'gui_LayoutFcn',  [] , ...
                   'gui_Callback',   []);
if nargin && ischar(varargin{1})
    gui_State.gui_Callback = str2func(varargin{1});
end

if nargout
    [varargout{1:nargout}] = gui_mainfcn(gui_State, varargin{:});
else
    gui_mainfcn(gui_State, varargin{:});
end
% End initialization code - DO NOT EDIT


% --- Executes just before InterfazMontana is made visible.
function InterfazMontana_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to InterfazMontana (see VARARGIN)

% Choose default command line output for InterfazMontana
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes InterfazMontana wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = InterfazMontana_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in botonAtras.
function botonAtras_Callback(hObject, eventdata, handles)
%Cuando se da el boton de atras se cierra la ventana actual y se abre la
%ventana principal
close;
interfazPrincipal;



function resultado_Callback(hObject, eventdata, handles)
% hObject    handle to resultado (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of resultado as text
%        str2double(get(hObject,'String')) returns contents of resultado as a double


% --- Executes during object creation, after setting all properties.
function resultado_CreateFcn(hObject, eventdata, handles)
% hObject    handle to resultado (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- se ejecuta cuando se presiona el boton resolver
function botonResolver_Callback(hObject, eventdata, handles)
%Obtener la matriz de la interfaz
data = get(handles.matriz,'data');

resultados = [];
try
    %Resolver llamando la funci�n de gauss
    resultados = Montante(data);
catch e
    set(handles.errorTexto,'String',e.message);
end

%Poner los resultados en la interfaz
resultadosString = [];
resultados = resultados';
[n, m] = size(resultados);  

for i = 1 : n
    resultadosString = [resultadosString ; 'x' num2str(i) '=  '];
end

%mostrarlo en la grafica
set(handles.resultado,'string',[resultadosString num2str(resultados)]);



function incognitasTexto_Callback(hObject, eventdata, handles)
% hObject    handle to incognitasTexto (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of incognitasTexto as text
%        str2double(get(hObject,'String')) returns contents of incognitasTexto as a double


% --- Executes during object creation, after setting all properties.
function incognitasTexto_CreateFcn(hObject, eventdata, handles)
% hObject    handle to incognitasTexto (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in botonGenerar.
function botonGenerar_Callback(hObject, eventdata, handles)
m=str2double(get(handles.incognitasTexto,'String'));
n=m+1;
table1 = zeros(m,n);
set(handles.matriz,'data',table1);
set(handles.matriz,'ColumnEditable', [true true true true true true true true true true true true true true true true true true true true true true true true]);
set(handles.Matriz,'visible','on');


% --- Executes on button press in botonLimpiar.
function botonLimpiar_Callback(hObject, eventdata, handles)
set(handles.incognitasTexto,'string','');
set(handles.errorTexto,'string','');
set(handles.resultado,'string','');
set(handles.matriz,'data',[]);


% --- Executes when user attempts to close figure1.
function figure1_CloseRequestFcn(hObject, eventdata, handles)
% hObject    handle to figure1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% Hint: delete(hObject) closes the figure
delete(hObject);
interfazPrincipal;
