function varargout = Week10_RegionFilling(varargin)
% WEEK10_REGIONFILLING MATLAB code for Week10_RegionFilling.fig
%      WEEK10_REGIONFILLING, by itself, creates a new WEEK10_REGIONFILLING or raises the existing
%      singleton*.
%
%      H = WEEK10_REGIONFILLING returns the handle to a new WEEK10_REGIONFILLING or the handle to
%      the existing singleton*.
%
%      WEEK10_REGIONFILLING('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in WEEK10_REGIONFILLING.M with the given input arguments.
%
%      WEEK10_REGIONFILLING('Property','Value',...) creates a new WEEK10_REGIONFILLING or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before Week10_RegionFilling_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to Week10_RegionFilling_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help Week10_RegionFilling

% Last Modified by GUIDE v2.5 22-Nov-2017 14:25:24

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @Week10_RegionFilling_OpeningFcn, ...
                   'gui_OutputFcn',  @Week10_RegionFilling_OutputFcn, ...
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


% --- Executes just before Week10_RegionFilling is made visible.
function Week10_RegionFilling_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to Week10_RegionFilling (see VARARGIN)

% Choose default command line output for Week10_RegionFilling
handles.output = hObject;
handles.kernel = [0,1,0;1,1,1;0,1,0];
handles.hand = im2double(imread('hand.jpg'));
handles.binhand = imbinarize(handles.hand, 0.5);
handles.final = handles.binhand;
handles.func = get(handles.axes1,'ButtonDownFcn');

handles.axes1.NextPlot = 'replace';
axes(handles.axes1);
handles.imhandle = imshow(handles.binhand);

set(handles.imhandle, 'ButtonDownFcn', handles.func);

% set(hObject, 'ButtonDownFcn', @axes1_ButtonDownFcn);
guidata(hObject, handles);

% UIWAIT makes Week10_RegionFilling wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = Week10_RegionFilling_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
handles.output = hObject;
% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on mouse press over axes background.
function axes1_ButtonDownFcn(hObject, eventdata, handles)
% hObject    handle to axes1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

pos = round(eventdata.IntersectionPoint(2:-1:1));
% For Debug
%
% assignin('base', 'axes', hObject);
% fprintf('%d %d\n', pos(2), pos(1));

handles.final = MyRegionFilling(handles.binhand, pos, handles.kernel);
handles.imhandle = imshow(handles.binhand + handles.final);
set(handles.imhandle, 'ButtonDownFcn', handles.func);
