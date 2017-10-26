function varargout = Week7(varargin)

gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @Week7_OpeningFcn, ...
                   'gui_OutputFcn',  @Week7_OutputFcn, ...
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



function Week7_OpeningFcn(hObject, eventdata, handles, varargin)

handles.output = hObject;

guidata(hObject, handles);



function varargout = Week7_OutputFcn(hObject, eventdata, handles) 

varargout{1} = handles.output;




%------------------------Start from here----------------------------

% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)
global phantom

phantom = imread('Phantom.png');
axes( %{fill here} );
imshow(phantom);


% --- Executes on button press in pushbutton2.
function pushbutton2_Callback(hObject, eventdata, handles)
global phantom

phantom = imread('Phantom.png');
phantom = imnoise(phantom, 'poisson');
axes( %{fill here} );
imshow(phantom);


% --- Executes on button press in pushbutton3.
function pushbutton3_Callback(hObject, eventdata, handles)
global phantom
global sino_image;

sino_image = %{fill here} ;
axes(handles.axes2);
imshow(sino_image, []);


% --- Executes on button press in pushbutton4.
function pushbutton4_Callback(hObject, eventdata, handles)
global filter;

filter = make_filt(1);
axes(handles.axes3);
plot(filter);


% --- Executes on button press in pushbutton5.
function pushbutton5_Callback(hObject, eventdata, handles)
global filter;

filter = make_filt(2);
axes(handles.axes3);
plot(filter);


% --- Executes on button press in pushbutton6.
function pushbutton6_Callback(hObject, eventdata, handles)
global filter;

filter = make_filt(0);
axes(handles.axes3);
plot(filter);


% --- Executes on button press in pushbutton7.
function pushbutton7_Callback(hObject, eventdata, handles)
global filter;
global sino_image;
global filtered;

filtered = apply_filter( sino_image, filter );
axes(handles.axes4);
imshow(filtered, []);


% --- Executes on button press in pushbutton8.
function pushbutton8_Callback(hObject, eventdata, handles)
global filtered;

recon_img = backprojection(filtered);
axes(handles.axes5);
imshow(real(recon_img), []);
