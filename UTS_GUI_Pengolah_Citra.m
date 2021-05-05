function varargout = UTS_GUI_Pengolah_Citra(varargin)
% UTS_GUI_PENGOLAH_CITRA MATLAB code for UTS_GUI_Pengolah_Citra.fig
%      UTS_GUI_PENGOLAH_CITRA, by itself, creates a new UTS_GUI_PENGOLAH_CITRA or raises the existing
%      singleton*.
%
%      H = UTS_GUI_PENGOLAH_CITRA returns the handle to a new UTS_GUI_PENGOLAH_CITRA or the handle to
%      the existing singleton*.
%
%      UTS_GUI_PENGOLAH_CITRA('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in UTS_GUI_PENGOLAH_CITRA.M with the given input arguments.
%
%      UTS_GUI_PENGOLAH_CITRA('Property','Value',...) creates a new UTS_GUI_PENGOLAH_CITRA or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before UTS_GUI_Pengolah_Citra_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to UTS_GUI_Pengolah_Citra_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help UTS_GUI_Pengolah_Citra

% Last Modified by GUIDE v2.5 05-May-2021 23:03:09

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @UTS_GUI_Pengolah_Citra_OpeningFcn, ...
                   'gui_OutputFcn',  @UTS_GUI_Pengolah_Citra_OutputFcn, ...
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


% --- Executes just before UTS_GUI_Pengolah_Citra is made visible.
function UTS_GUI_Pengolah_Citra_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to UTS_GUI_Pengolah_Citra (see VARARGIN)

% Choose default command line output for UTS_GUI_Pengolah_Citra
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes UTS_GUI_Pengolah_Citra wait for user response (see UIRESUME)
% uiwait(handles.figure1);
buat_axes = axes('unit', 'normalized', 'position', [0 0  1 1]);
backgroundnya = imread('bg-grey.jpg');
imagesc(backgroundnya);
set(buat_axes, 'handlevisibility', 'off', 'visible', 'off')

% --- Outputs from this function are returned to the command line.
function varargout = UTS_GUI_Pengolah_Citra_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
[filename, pathname] = uigetfile('*.png;*.jpg;*.tif','Files of type (*.png,*.jpg,*.tif)');
if ~isequal(filename,0)
    Img = imread(fullfile(pathname,filename));
    [~,~,m] = size(Img);
    if m == 3
        axes(handles.axes1)
        imshow(Img)
        handles.Img = Img;
        guidata(hObject, handles)
    else
        msgbox('Please insert RGB Image')
    end
else
    return;
end