function varargout = tryimage1(varargin)
% TRYIMAGE1 MATLAB code for tryimage1.fig
%      TRYIMAGE1, by itself, creates a new TRYIMAGE1 or raises the existing
%      singleton*.
%
%      H = TRYIMAGE1 returns the handle to a new TRYIMAGE1 or the handle to
%      the existing singleton*.
%
%      TRYIMAGE1('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in TRYIMAGE1.M with the given input arguments.
%
%      TRYIMAGE1('Property','Value',...) creates a new TRYIMAGE1 or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before tryimage1_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to tryimage1_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help tryimage1

% Last Modified by GUIDE v2.5 11-Mar-2017 11:38:33

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @tryimage1_OpeningFcn, ...
                   'gui_OutputFcn',  @tryimage1_OutputFcn, ...
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


% --- Executes just before tryimage1 is made visible.
function tryimage1_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to tryimage1 (see VARARGIN)

% Choose default command line output for tryimage1
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes tryimage1 wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = tryimage1_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on slider movement.
function slider1_Callback(hObject, eventdata, handles)
% hObject    handle to slider1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global image1;
val =get(hObject,'Value');
bright = min((val+image1),255);
axes(handles.axes1);
imshow(bright);
% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider


% --- Executes during object creation, after setting all properties.
function slider1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to slider1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global image2

% --- Executes on button press in pushbutton2.
axes(handles.axes1);
imshow(image2);
function pushbutton2_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global image1

imblack=1-image1;
axes(handles.axes1);
imshow(imblack);

% --- Executes on button press in pushbutton3.
function pushbutton3_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in pushbutton4.
function pushbutton4_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global image1 image2;

[path,cancels] =imgetfile();
if cancels
    msgbox(sprintf('Error'),'Error','Error');
    return
end
image1 =imread(path);
image1 =im2double(image1);
image2 = image1;
axes(handles.axes1);
imshow(image1);


% --- Executes on button press in pushbutton5.
function pushbutton5_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global image1

grey = (image1(:,:,1)+image1(:,:,2)+image1(:,:,3))/3;
axes(handles.axes1);
imshow(grey);
