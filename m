Content-Type: multipart/mixed; boundary="===============8071543264625761223=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/firmware/arm_scmi/powercap.c:129:27: warning: use of uninitialized value '<unknown>' [CWE-457]
Date: Tue, 09 Aug 2022 09:39:12 +0800
Message-ID: <202208090959.bTh94NNl-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============8071543264625761223==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

:::::: =

:::::: Manual check reason: "low confidence bisect report"
:::::: Manual check reason: "low confidence static check warning: drivers/f=
irmware/arm_scmi/powercap.c:129:27: warning: use of uninitialized value '<u=
nknown>' [CWE-457] [-Wanalyzer-use-of-uninitialized-value]"
:::::: =


BCC: lkp(a)intel.com
CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: Cristian Marussi <cristian.marussi@arm.com>
CC: Sudeep Holla <sudeep.holla@arm.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   5d5d353bed32dc3ea52e2619e0d1c60b17133b91
commit: 0316f99c4780b0a5fd60b7f136c64cb1af8d5fc3 firmware: arm_scmi: Add SC=
MI v3.1 powercap protocol basic support
date:   5 weeks ago
:::::: branch date: 3 hours ago
:::::: commit date: 5 weeks ago
config: arm-randconfig-c002-20220804 (https://download.01.org/0day-ci/archi=
ve/20220809/202208090959.bTh94NNl-lkp(a)intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 12.1.0
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.gi=
t/commit/?id=3D0316f99c4780b0a5fd60b7f136c64cb1af8d5fc3
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/gi=
t/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout 0316f99c4780b0a5fd60b7f136c64cb1af8d5fc3
        # save the config file
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dgcc-12.1.0 make.cross=
 ARCH=3Darm KBUILD_USERCFLAGS=3D'-fanalyzer -Wno-error' =


If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

gcc-analyzer warnings: (new ones prefixed by >>)
   drivers/firmware/arm_scmi/powercap.c: In function 'scmi_powercap_attribu=
tes_get':
>> drivers/firmware/arm_scmi/powercap.c:129:27: warning: use of uninitializ=
ed value '<unknown>' [CWE-457] [-Wanalyzer-use-of-uninitialized-value]
     129 |         struct scmi_xfer *t;
         |                           ^
     'scmi_powercap_attributes_get': event 1
       |
       |  129 |         struct scmi_xfer *t;
       |      |                           ^
       |      |                           |
       |      |                           (1) use of uninitialized value '<=
unknown>' here
       |
   drivers/firmware/arm_scmi/powercap.c: In function 'scmi_powercap_domain_=
attributes_get':
   drivers/firmware/arm_scmi/powercap.c:171:27: warning: use of uninitializ=
ed value '<unknown>' [CWE-457] [-Wanalyzer-use-of-uninitialized-value]
     171 |         struct scmi_xfer *t;
         |                           ^
     'scmi_powercap_domain_attributes_get': event 1
       |
       |  171 |         struct scmi_xfer *t;
       |      |                           ^
       |      |                           |
       |      |                           (1) use of uninitialized value '<=
unknown>' here
       |
   drivers/firmware/arm_scmi/powercap.c: In function 'scmi_powercap_cap_get=
':
   drivers/firmware/arm_scmi/powercap.c:287:27: warning: use of uninitializ=
ed value '<unknown>' [CWE-457] [-Wanalyzer-use-of-uninitialized-value]
     287 |         struct scmi_xfer *t;
         |                           ^
     'scmi_powercap_cap_get': event 1
       |
       |  287 |         struct scmi_xfer *t;
       |      |                           ^
       |      |                           |
       |      |                           (1) use of uninitialized value '<=
unknown>' here
       |
   drivers/firmware/arm_scmi/powercap.c: In function 'scmi_powercap_cap_set=
':
   drivers/firmware/arm_scmi/powercap.c:313:27: warning: use of uninitializ=
ed value '<unknown>' [CWE-457] [-Wanalyzer-use-of-uninitialized-value]
     313 |         struct scmi_xfer *t;
         |                           ^
     'scmi_powercap_cap_set': event 1
       |
       |  313 |         struct scmi_xfer *t;
       |      |                           ^
       |      |                           |
       |      |                           (1) use of uninitialized value '<=
unknown>' here
       |
   drivers/firmware/arm_scmi/powercap.c: In function 'scmi_powercap_pai_get=
':
   drivers/firmware/arm_scmi/powercap.c:361:27: warning: use of uninitializ=
ed value '<unknown>' [CWE-457] [-Wanalyzer-use-of-uninitialized-value]
     361 |         struct scmi_xfer *t;
         |                           ^
     'scmi_powercap_pai_get': event 1
       |
       |  361 |         struct scmi_xfer *t;
       |      |                           ^
       |      |                           |
       |      |                           (1) use of uninitialized value '<=
unknown>' here
       |
   drivers/firmware/arm_scmi/powercap.c: In function 'scmi_powercap_pai_set=
':
   drivers/firmware/arm_scmi/powercap.c:386:27: warning: use of uninitializ=
ed value '<unknown>' [CWE-457] [-Wanalyzer-use-of-uninitialized-value]
     386 |         struct scmi_xfer *t;
         |                           ^
     'scmi_powercap_pai_set': event 1
       |
       |  386 |         struct scmi_xfer *t;
       |      |                           ^
       |      |                           |
       |      |                           (1) use of uninitialized value '<=
unknown>' here
       |
   drivers/firmware/arm_scmi/powercap.c: In function 'scmi_powercap_measure=
ments_get':
   drivers/firmware/arm_scmi/powercap.c:416:27: warning: use of uninitializ=
ed value '<unknown>' [CWE-457] [-Wanalyzer-use-of-uninitialized-value]
     416 |         struct scmi_xfer *t;
         |                           ^
     'scmi_powercap_measurements_get': event 1
       |
       |  416 |         struct scmi_xfer *t;
       |      |                           ^
       |      |                           |
       |      |                           (1) use of uninitialized value '<=
unknown>' here
       |
   drivers/firmware/arm_scmi/powercap.c: In function 'scmi_powercap_notify':
   drivers/firmware/arm_scmi/powercap.c:504:27: warning: use of uninitializ=
ed value '<unknown>' [CWE-457] [-Wanalyzer-use-of-uninitialized-value]
     504 |         struct scmi_xfer *t;
         |                           ^
     'scmi_powercap_notify': event 1
       |
       |  504 |         struct scmi_xfer *t;
       |      |                           ^
       |      |                           |
       |      |                           (1) use of uninitialized value '<=
unknown>' here
       |
   drivers/firmware/arm_scmi/powercap.c:523:21: warning: use of uninitializ=
ed value '<unknown>' [CWE-457] [-Wanalyzer-use-of-uninitialized-value]
     523 |                 u32 low, high;
         |                     ^~~
     'scmi_powercap_notify': events 1-3
       |
       |  506 |         switch (message_id) {
       |      |         ^~~~~~
       |      |         |
       |      |         (1) following 'case 11:' branch...
       |......
       |  521 |         case POWERCAP_MEASUREMENTS_NOTIFY:
       |      |         ~~~~
       |      |         |
       |      |         (2) ...to here

vim +129 drivers/firmware/arm_scmi/powercap.c

0316f99c4780b0a5 Cristian Marussi 2022-07-04  120  =

0316f99c4780b0a5 Cristian Marussi 2022-07-04  121  static int scmi_powercap=
_notify(const struct scmi_protocol_handle *ph,
0316f99c4780b0a5 Cristian Marussi 2022-07-04  122  				u32 domain, int mess=
age_id, bool enable);
0316f99c4780b0a5 Cristian Marussi 2022-07-04  123  =

0316f99c4780b0a5 Cristian Marussi 2022-07-04  124  static int
0316f99c4780b0a5 Cristian Marussi 2022-07-04  125  scmi_powercap_attributes=
_get(const struct scmi_protocol_handle *ph,
0316f99c4780b0a5 Cristian Marussi 2022-07-04  126  			     struct powercap_=
info *pi)
0316f99c4780b0a5 Cristian Marussi 2022-07-04  127  {
0316f99c4780b0a5 Cristian Marussi 2022-07-04  128  	int ret;
0316f99c4780b0a5 Cristian Marussi 2022-07-04 @129  	struct scmi_xfer *t;
0316f99c4780b0a5 Cristian Marussi 2022-07-04  130  =

0316f99c4780b0a5 Cristian Marussi 2022-07-04  131  	ret =3D ph->xops->xfer_=
get_init(ph, PROTOCOL_ATTRIBUTES, 0,
0316f99c4780b0a5 Cristian Marussi 2022-07-04  132  				      sizeof(u32), &=
t);
0316f99c4780b0a5 Cristian Marussi 2022-07-04  133  	if (ret)
0316f99c4780b0a5 Cristian Marussi 2022-07-04  134  		return ret;
0316f99c4780b0a5 Cristian Marussi 2022-07-04  135  =

0316f99c4780b0a5 Cristian Marussi 2022-07-04  136  	ret =3D ph->xops->do_xf=
er(ph, t);
0316f99c4780b0a5 Cristian Marussi 2022-07-04  137  	if (!ret) {
0316f99c4780b0a5 Cristian Marussi 2022-07-04  138  		u32 attributes;
0316f99c4780b0a5 Cristian Marussi 2022-07-04  139  =

0316f99c4780b0a5 Cristian Marussi 2022-07-04  140  		attributes =3D get_una=
ligned_le32(t->rx.buf);
0316f99c4780b0a5 Cristian Marussi 2022-07-04  141  		pi->num_domains =3D FI=
ELD_GET(GENMASK(15, 0), attributes);
0316f99c4780b0a5 Cristian Marussi 2022-07-04  142  	}
0316f99c4780b0a5 Cristian Marussi 2022-07-04  143  =

0316f99c4780b0a5 Cristian Marussi 2022-07-04  144  	ph->xops->xfer_put(ph, =
t);
0316f99c4780b0a5 Cristian Marussi 2022-07-04  145  	return ret;
0316f99c4780b0a5 Cristian Marussi 2022-07-04  146  }
0316f99c4780b0a5 Cristian Marussi 2022-07-04  147  =


-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============8071543264625761223==--

