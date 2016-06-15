#
# Copyright (c) 2016 B1 Systems GmbH, Vohburg, Germany.
#
# All modifications and additions to the file contributed by third parties
# remain the property of their copyright owners, unless otherwise agreed
# upon. The license for this file, and modifications and additions to the
# file, is the same license as for the pristine package itself (unless the
# license for the pristine package is not an Open Source License, in which
# case the license is the MIT License). An "Open Source License" is a
# license that conforms to the Open Source Definition (Version 1.9)
# published by the Open Source Initiative.
#

%define src_name obsdemo_packages

Name:           demotest2
Version:        0.0.0
Release:        5.0
License:        GPL-2.0+
Source:         %{src_name}-%{version}.tar.xz
BuildRoot:      %{_tmppath}/%{name}-%{version}-build
Summary:        Demo test2 package 
Group:          Development/Libraries/Other
Vendor:         B1 Systems GmbH

BuildRequires: gcc
BuildRequires: pkgconfig
BuildRequires: cmake
BuildRequires: demotest1-devel 
#Requires:


%description
Demo test 2 package for OBS testing

%package devel
Summary:        Demo test2 package devel
Group:          Development/Libraries/Other
Requires:       demotest2 = %{version}-%{release}

%description devel
Demo test 2 package for OBS testing devel


%prep
%setup -n %{src_name}-%{version}

%build
mkdir build
cd build
export CXXFLAGS="%{optflags}"
export CFLAGS="%{optflags}"

cmake  -DCMAKE_INSTALL_PREFIX=%{_prefix} \
       -DLIB_INSTALL_DIR=%{_lib} \
       -G "Unix Makefiles" \
       ../

make %{?_smp_mflags} VERBOSE=1

%install
cd build
%makeinstall


%post -p /sbin/ldconfig

%postun -p /sbin/ldconfig

%clean
rm -rf $RPM_BUILD_ROOT

%files
%defattr(0755,root,root,0750)
%{_prefix}/bin/*
%{_libdir}/*.so.*

%files devel
%defattr(0644,root,root,0755)
%{_libdir}/*.so
%dir %{_prefix}/include/demotest2
%{_prefix}/include/demotest2/*
%{_libdir}/*.a
%dir %{_datadir}/cmake
%dir %{_datadir}/cmake/Modules
%{_datadir}/cmake/Modules/FindLibdemoB.cmake
%dir %{_libdir}/pkgconfig
%{_libdir}/pkgconfig/*.pc

%changelog
