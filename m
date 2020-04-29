Content-Type: multipart/mixed; boundary="===============7190958483836675722=="
MIME-Version: 1.0
From: kbuild test robot <lkp@intel.com>
Subject: [tobetter-linux:odroid-5.7.y 14/15] drivers/input/touchscreen/dwav-usb-mt.c:554:28: sparse: sparse: no newline at end of file
Date: Thu, 30 Apr 2020 07:16:25 +0800
Message-ID: <202004300721.c5KsaxkU%lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============7190958483836675722==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
TO: Hyeonki Hong <hhk7734@gmail.com>
CC: Dongjin Kim <tobetter@gmail.com>

tree:   https://github.com/tobetter/linux odroid-5.7.y
head:   de6229921716005f03f8bbd04e21262095b8fd4b
commit: 85ab26b729a3eeb1ad89f371a8e543f1f959170c [14/15] ODROID-COMMON: inp=
ut/touchscreen: Add D-WAV Multitouch driver.
reproduce:
        # apt-get install sparse
        # sparse version: v0.6.1-191-gc51a0382-dirty
        git checkout 85ab26b729a3eeb1ad89f371a8e543f1f959170c
        make ARCH=3Dx86_64 allmodconfig
        make C=3D1 CF=3D'-fdiagnostic-prefix -D__CHECK_ENDIAN__'
:::::: branch date: 29 hours ago
:::::: commit date: 31 hours ago

If you fix the issue, kindly add following tag as appropriate
Reported-by: kbuild test robot <lkp@intel.com>


sparse warnings: (new ones prefixed by >>)

>> drivers/input/touchscreen/dwav-usb-mt.c:554:28: sparse: sparse: no newli=
ne at end of file
>> drivers/input/touchscreen/dwav-usb-mt.c:176:41: sparse: sparse: incorrec=
t type in assignment (different base types) @@    expected unsigned int x @=
@    got restricted __be1unsigned int x @@
>> drivers/input/touchscreen/dwav-usb-mt.c:176:41: sparse:    expected unsi=
gned int x
>> drivers/input/touchscreen/dwav-usb-mt.c:176:41: sparse:    got restricte=
d __be16 [usertype]
>> drivers/input/touchscreen/dwav-usb-mt.c:178:41: sparse: sparse: incorrec=
t type in assignment (different base types) @@    expected unsigned int y @=
@    got restricted __be1unsigned int y @@
>> drivers/input/touchscreen/dwav-usb-mt.c:178:41: sparse:    expected unsi=
gned int y
   drivers/input/touchscreen/dwav-usb-mt.c:178:41: sparse:    got restricte=
d __be16 [usertype]
   drivers/input/touchscreen/dwav-usb-mt.c:182:41: sparse: sparse: incorrec=
t type in assignment (different base types) @@    expected unsigned int x @=
@    got restricted __be1unsigned int x @@
   drivers/input/touchscreen/dwav-usb-mt.c:182:41: sparse:    expected unsi=
gned int x
   drivers/input/touchscreen/dwav-usb-mt.c:182:41: sparse:    got restricte=
d __be16 [usertype]
   drivers/input/touchscreen/dwav-usb-mt.c:184:41: sparse: sparse: incorrec=
t type in assignment (different base types) @@    expected unsigned int y @=
@    got restricted __be1unsigned int y @@
   drivers/input/touchscreen/dwav-usb-mt.c:184:41: sparse:    expected unsi=
gned int y
   drivers/input/touchscreen/dwav-usb-mt.c:184:41: sparse:    got restricte=
d __be16 [usertype]
   drivers/input/touchscreen/dwav-usb-mt.c:188:41: sparse: sparse: incorrec=
t type in assignment (different base types) @@    expected unsigned int x @=
@    got restricted __be1unsigned int x @@
   drivers/input/touchscreen/dwav-usb-mt.c:188:41: sparse:    expected unsi=
gned int x
   drivers/input/touchscreen/dwav-usb-mt.c:188:41: sparse:    got restricte=
d __be16 [usertype]
   drivers/input/touchscreen/dwav-usb-mt.c:190:41: sparse: sparse: incorrec=
t type in assignment (different base types) @@    expected unsigned int y @=
@    got restricted __be1unsigned int y @@
   drivers/input/touchscreen/dwav-usb-mt.c:190:41: sparse:    expected unsi=
gned int y
   drivers/input/touchscreen/dwav-usb-mt.c:190:41: sparse:    got restricte=
d __be16 [usertype]
   drivers/input/touchscreen/dwav-usb-mt.c:194:41: sparse: sparse: incorrec=
t type in assignment (different base types) @@    expected unsigned int x @=
@    got restricted __be1unsigned int x @@
   drivers/input/touchscreen/dwav-usb-mt.c:194:41: sparse:    expected unsi=
gned int x
   drivers/input/touchscreen/dwav-usb-mt.c:194:41: sparse:    got restricte=
d __be16 [usertype]
   drivers/input/touchscreen/dwav-usb-mt.c:196:41: sparse: sparse: incorrec=
t type in assignment (different base types) @@    expected unsigned int y @=
@    got restricted __be1unsigned int y @@
   drivers/input/touchscreen/dwav-usb-mt.c:196:41: sparse:    expected unsi=
gned int y
   drivers/input/touchscreen/dwav-usb-mt.c:196:41: sparse:    got restricte=
d __be16 [usertype]
   drivers/input/touchscreen/dwav-usb-mt.c:200:41: sparse: sparse: incorrec=
t type in assignment (different base types) @@    expected unsigned int x @=
@    got restricted __be1unsigned int x @@
   drivers/input/touchscreen/dwav-usb-mt.c:200:41: sparse:    expected unsi=
gned int x
   drivers/input/touchscreen/dwav-usb-mt.c:200:41: sparse:    got restricte=
d __be16 [usertype]
   drivers/input/touchscreen/dwav-usb-mt.c:202:41: sparse: sparse: incorrec=
t type in assignment (different base types) @@    expected unsigned int y @=
@    got restricted __be1unsigned int y @@
   drivers/input/touchscreen/dwav-usb-mt.c:202:41: sparse:    expected unsi=
gned int y
   drivers/input/touchscreen/dwav-usb-mt.c:202:41: sparse:    got restricte=
d __be16 [usertype]

# https://github.com/tobetter/linux/commit/85ab26b729a3eeb1ad89f371a8e543f1=
f959170c
git remote add tobetter-linux https://github.com/tobetter/linux
git remote update tobetter-linux
git checkout 85ab26b729a3eeb1ad89f371a8e543f1f959170c
vim +554 drivers/input/touchscreen/dwav-usb-mt.c

85ab26b729a3eeb Hyeonki Hong 2020-03-05  553  =

85ab26b729a3eeb Hyeonki Hong 2020-03-05 @554  MODULE_ALIAS("dwav_usb_mt");

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============7190958483836675722==--

