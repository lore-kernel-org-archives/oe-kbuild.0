Content-Type: multipart/mixed; boundary="===============5853163984068364014=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [lee-linaro:tb-mfd-fix-warnings 2/27] drivers/usb/typec/tcpm/tcpm.c:979:29: warning: Possible null pointer dereference: data
Date: Wed, 05 Aug 2020 18:44:34 +0800
Message-ID: <202008051831.ZEdTYOjU%lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============5853163984068364014==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
TO: Lee Jones <lee.jones@linaro.org>

tree:   https://git.linaro.org/people/lee.jones/linux.git tb-mfd-fix-warnin=
gs
head:   f8a15affc0c5e6eb9cb250252879f6ffb38fe341
commit: 0a25134bb16aa5ea1aa79b030d15a1ffcb2278b4 [2/27] NO UPSTREAM ----- u=
sb: typec: tcpm: tcpm: Remove dangling unused 'struct tcpm_altmode_ops'
:::::: branch date: 5 days ago
:::::: commit date: 5 days ago
compiler: powerpc-linux-gcc (GCC) 9.3.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


cppcheck warnings: (new ones prefixed by >>)

>> drivers/usb/typec/tcpm/tcpm.c:979:29: warning: Possible null pointer der=
eference: data [nullPointer]
    memcpy(&port->vdo_data[1], data, sizeof(u32) * cnt);
                               ^
   drivers/usb/typec/tcpm/tcpm.c:2861:55: note: Calling function 'tcpm_send=
_vdm', 4th argument 'NULL' value is 0
     tcpm_send_vdm(port, USB_SID_PD, CMD_DISCOVER_IDENT, NULL, 0);
                                                         ^
   drivers/usb/typec/tcpm/tcpm.c:1326:31: note: Calling function 'tcpm_queu=
e_vdm', 3rd argument 'data' value is 0
    tcpm_queue_vdm(port, header, data, count);
                                 ^
   drivers/usb/typec/tcpm/tcpm.c:979:29: note: Null pointer dereference
    memcpy(&port->vdo_data[1], data, sizeof(u32) * cnt);
                               ^
   drivers/usb/typec/tcpm/tcpm.c:2418:30: warning: Clarify calculation prec=
edence for '&' and '?'. [clarifyCalculation]
       flags & RDO_CAP_MISMATCH ? " [mismatch]" : "");
                                ^
   drivers/usb/typec/tcpm/tcpm.c:2424:30: warning: Clarify calculation prec=
edence for '&' and '?'. [clarifyCalculation]
       flags & RDO_CAP_MISMATCH ? " [mismatch]" : "");
                                ^

git remote add lee-linaro https://git.linaro.org/people/lee.jones/linux.git
git remote update lee-linaro
git checkout 0a25134bb16aa5ea1aa79b030d15a1ffcb2278b4
vim +979 drivers/usb/typec/tcpm/tcpm.c

f0690a25a140b8 drivers/staging/typec/tcpm.c  Guenter Roeck 2017-04-27  965  =

f0690a25a140b8 drivers/staging/typec/tcpm.c  Guenter Roeck 2017-04-27  966 =
 /*
f0690a25a140b8 drivers/staging/typec/tcpm.c  Guenter Roeck 2017-04-27  967 =
  * VDM/VDO handling functions
f0690a25a140b8 drivers/staging/typec/tcpm.c  Guenter Roeck 2017-04-27  968 =
  */
f0690a25a140b8 drivers/staging/typec/tcpm.c  Guenter Roeck 2017-04-27  969 =
 static void tcpm_queue_vdm(struct tcpm_port *port, const u32 header,
f0690a25a140b8 drivers/staging/typec/tcpm.c  Guenter Roeck 2017-04-27  970 =
 			   const u32 *data, int cnt)
f0690a25a140b8 drivers/staging/typec/tcpm.c  Guenter Roeck 2017-04-27  971 =
 {
03eafcfb60c0da drivers/usb/typec/tcpm/tcpm.c Hans de Goede 2020-07-24  972 =
 	WARN_ON(!mutex_is_locked(&port->lock));
03eafcfb60c0da drivers/usb/typec/tcpm/tcpm.c Hans de Goede 2020-07-24  973  =

754498c1d6369d drivers/usb/typec/tcpm/tcpm.c Hans de Goede 2020-07-24  974 =
 	/* Make sure we are not still processing a previous VDM packet */
754498c1d6369d drivers/usb/typec/tcpm/tcpm.c Hans de Goede 2020-07-24  975 =
 	WARN_ON(port->vdm_state > VDM_STATE_DONE);
754498c1d6369d drivers/usb/typec/tcpm/tcpm.c Hans de Goede 2020-07-24  976  =

f0690a25a140b8 drivers/staging/typec/tcpm.c  Guenter Roeck 2017-04-27  977 =
 	port->vdo_count =3D cnt + 1;
f0690a25a140b8 drivers/staging/typec/tcpm.c  Guenter Roeck 2017-04-27  978 =
 	port->vdo_data[0] =3D header;
f0690a25a140b8 drivers/staging/typec/tcpm.c  Guenter Roeck 2017-04-27 @979 =
 	memcpy(&port->vdo_data[1], data, sizeof(u32) * cnt);
f0690a25a140b8 drivers/staging/typec/tcpm.c  Guenter Roeck 2017-04-27  980 =
 	/* Set ready, vdm state machine will actually send */
f0690a25a140b8 drivers/staging/typec/tcpm.c  Guenter Roeck 2017-04-27  981 =
 	port->vdm_retries =3D 0;
f0690a25a140b8 drivers/staging/typec/tcpm.c  Guenter Roeck 2017-04-27  982 =
 	port->vdm_state =3D VDM_STATE_READY;
5f2b8d87bca528 drivers/usb/typec/tcpm/tcpm.c Hans de Goede 2020-07-24  983  =

5f2b8d87bca528 drivers/usb/typec/tcpm/tcpm.c Hans de Goede 2020-07-24  984 =
 	mod_delayed_work(port->wq, &port->vdm_state_machine, 0);
f0690a25a140b8 drivers/staging/typec/tcpm.c  Guenter Roeck 2017-04-27  985 =
 }
f0690a25a140b8 drivers/staging/typec/tcpm.c  Guenter Roeck 2017-04-27  986  =


:::::: The code at line 979 was first introduced by commit
:::::: f0690a25a140b853b1842fa80faf828601bb47e8 staging: typec: USB Type-C =
Port Manager (tcpm)

:::::: TO: Guenter Roeck <groeck@chromium.org>
:::::: CC: Greg Kroah-Hartman <gregkh@linuxfoundation.org>

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============5853163984068364014==--

