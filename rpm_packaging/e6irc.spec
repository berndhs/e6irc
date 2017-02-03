%define sourceversion 0.7.0
%define relcount 2
%define assume_meego 0

Name:    e6irc
Version: %{sourceversion}
Release: %{relcount}
Summary: E6Irc IRC from Egalite

License: GPLv2
Group:   Applications/Network
Packager: Bernd Stramm <bernd.stramm@gmail.com>
Url:     http://e6irc.sourceforge.net/
Source: %{name}_%{version}.tar.gz
BuildRoot: %{_tmppath}/%{name}-%{version}-%{release}-root-%(%{__id_u} -n)


# >> macros
%if X%{_vendor} == "Xmeego"
%define my_buildhost "meego"
%else
%define my_exec_dir "/usr/bin"
%if X%{_vendor} == "Xredhat"
%define qmake qmake-qt4 \
make
%else
%define qmake qmake \
make
%endif
%define qmake_install mkdir -p %{buildroot}%{my_exec_dir} && \
make INSTALL_ROOT=%{buildroot} install
%define my_buildhost non-meego-%{vendor}
%endif
# << macros

# TODO: patches (?)


#Obsoletes:

#Provides: 

BuildRequires: pkgconfig(QtNetwork) >= 4.7
BuildRequires: pkgconfig(QtDeclarative) >= 4.7
BuildRequires: qt-mobility-devel

BuildRequires: desktop-file-utils
BuildRequires: gcc-c++

%description
IRC Chat with colleagues, friends and enemies


%prep
%setup

%build
cp %{name}-linux.pro %{name}-linux.pro.save
rm -f *.pro
mv %{name}-linux.pro.save %{name}.pro
%qmake

%install

%qmake_install

%clean
rm -rf %{buildroot}


%post 

%postun 


%files
%defattr(-,root,root,-)
%doc README
%doc COPYRIGHT
%doc LICENSE.txt
%{_bindir}/%{name}
%{_datadir}/applications/%{name}.desktop
%{_datadir}/pixmaps/%{name}.png

%changelog
* Fri Oct 28 2011 Bernd Stramm <bernd.stramm@gmail.com> - 0.6.6 
 - default size for N950

* Sat Oct 01 2011 Bernd Stramm <bernd.stramm@gmail.com> - 0.6.5 
 - command line options; qml details
 - fix bug in window size change detection
 - version

* Mon Sep 05 2011 Bernd Stramm <bernd.stramm@gmail.com> - 0.6.4 
 - fix bug in window size change detection

* Thu Sep 01 2011 Bernd Stramm <bernd.stramm@gmail.com> - 0.6.3 
 - support multi-channel join: JOIN #chan1 #chan2 #chan3

* Tue Aug 30 2011 Bernd Stramm <bernd.stramm@gmail.com> - 0.6.2 
 - deal with pop-up virtual keybboard a bit
 - suppress initial caps where not appropriate
 - functions to delete servers, channels, nicks
 - better editing of new user/server/channel; packing issues;

* Sun Aug 28 2011 Bernd Stramm <bernd.stramm@gmail.com> - 0.6.1 
 - count objects
 - suppress initial caps where not appropriate
 - functions to delete servers, channels, nicks
 - better editing of new user/server/channel; packing issues;
 - add channels; servers and nicks to database
 - use geuzen text browser; some costmetics;
 - mark things as being gpl2, hopefully in all neccessary places

* Wed Aug 24 2011 Bernd Stramm <bernd.stramm@gmail.com> - 0.6.0 
- convert egalite code to stand-alone IRC client
- make more suitable for phone-size displays

