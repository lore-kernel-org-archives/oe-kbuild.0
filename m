Content-Type: multipart/mixed; boundary="===============7694187925096357729=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: Re: [PATCH 1/1] usb: typec: tcpm: remove unused static variable 'tcpm_altmode_ops'
Date: Thu, 08 Apr 2021 05:00:39 +0800
Message-ID: <202104080436.iXwQ3Auw-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============7694187925096357729==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
In-Reply-To: <20210407091540.2815-1-thunder.leizhen@huawei.com>
References: <20210407091540.2815-1-thunder.leizhen@huawei.com>
TO: Zhen Lei <thunder.leizhen@huawei.com>
TO: Guenter Roeck <linux@roeck-us.net>
TO: Heikki Krogerus <heikki.krogerus@linux.intel.com>
TO: "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>
TO: "linux-usb" <linux-usb@vger.kernel.org>
TO: "linux-kernel" <linux-kernel@vger.kernel.org>
CC: Zhen Lei <thunder.leizhen@huawei.com>
CC: Hans de Goede <hdegoede@redhat.com>

Hi Zhen,

Thank you for the patch! Perhaps something to improve:

[auto build test WARNING on usb/usb-testing]
[also build test WARNING on v5.12-rc6 next-20210407]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/0day-ci/linux/commits/Zhen-Lei/usb-typec-tcpm-re=
move-unused-static-variable-tcpm_altmode_ops/20210407-171848
base:   https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git usb-=
testing
:::::: branch date: 12 hours ago
:::::: commit date: 12 hours ago
compiler: xtensa-linux-gcc (GCC) 9.3.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


cppcheck possible warnings: (new ones prefixed by >>, may not real problems)

>> drivers/usb/typec/tcpm/tcpm.c:1363:29: warning: Possible null pointer de=
reference: data [nullPointer]
    memcpy(&port->vdo_data[1], data, sizeof(u32) * cnt);
                               ^
   drivers/usb/typec/tcpm/tcpm.c:3604:55: note: Calling function 'tcpm_send=
_vdm', 4th argument 'NULL' value is 0
     tcpm_send_vdm(port, USB_SID_PD, CMD_DISCOVER_IDENT, NULL, 0);
                                                         ^
   drivers/usb/typec/tcpm/tcpm.c:1767:31: note: Calling function 'tcpm_queu=
e_vdm', 3rd argument 'data' value is 0
    tcpm_queue_vdm(port, header, data, count);
                                 ^
   drivers/usb/typec/tcpm/tcpm.c:1363:29: note: Null pointer dereference
    memcpy(&port->vdo_data[1], data, sizeof(u32) * cnt);
                               ^

vim +1363 drivers/usb/typec/tcpm/tcpm.c

0908c5aca31eb5 drivers/usb/typec/tcpm/tcpm.c Kyle Tso               2021-01=
-14  1349  =

f0690a25a140b8 drivers/staging/typec/tcpm.c  Guenter Roeck          2017-04=
-27  1350  /*
f0690a25a140b8 drivers/staging/typec/tcpm.c  Guenter Roeck          2017-04=
-27  1351   * VDM/VDO handling functions
f0690a25a140b8 drivers/staging/typec/tcpm.c  Guenter Roeck          2017-04=
-27  1352   */
f0690a25a140b8 drivers/staging/typec/tcpm.c  Guenter Roeck          2017-04=
-27  1353  static void tcpm_queue_vdm(struct tcpm_port *port, const u32 hea=
der,
f0690a25a140b8 drivers/staging/typec/tcpm.c  Guenter Roeck          2017-04=
-27  1354  			   const u32 *data, int cnt)
f0690a25a140b8 drivers/staging/typec/tcpm.c  Guenter Roeck          2017-04=
-27  1355  {
03eafcfb60c0da drivers/usb/typec/tcpm/tcpm.c Hans de Goede          2020-07=
-24  1356  	WARN_ON(!mutex_is_locked(&port->lock));
03eafcfb60c0da drivers/usb/typec/tcpm/tcpm.c Hans de Goede          2020-07=
-24  1357  =

754498c1d6369d drivers/usb/typec/tcpm/tcpm.c Hans de Goede          2020-07=
-24  1358  	/* Make sure we are not still processing a previous VDM packet =
*/
754498c1d6369d drivers/usb/typec/tcpm/tcpm.c Hans de Goede          2020-07=
-24  1359  	WARN_ON(port->vdm_state > VDM_STATE_DONE);
754498c1d6369d drivers/usb/typec/tcpm/tcpm.c Hans de Goede          2020-07=
-24  1360  =

f0690a25a140b8 drivers/staging/typec/tcpm.c  Guenter Roeck          2017-04=
-27  1361  	port->vdo_count =3D cnt + 1;
f0690a25a140b8 drivers/staging/typec/tcpm.c  Guenter Roeck          2017-04=
-27  1362  	port->vdo_data[0] =3D header;
f0690a25a140b8 drivers/staging/typec/tcpm.c  Guenter Roeck          2017-04=
-27 @1363  	memcpy(&port->vdo_data[1], data, sizeof(u32) * cnt);
f0690a25a140b8 drivers/staging/typec/tcpm.c  Guenter Roeck          2017-04=
-27  1364  	/* Set ready, vdm state machine will actually send */
f0690a25a140b8 drivers/staging/typec/tcpm.c  Guenter Roeck          2017-04=
-27  1365  	port->vdm_retries =3D 0;
f0690a25a140b8 drivers/staging/typec/tcpm.c  Guenter Roeck          2017-04=
-27  1366  	port->vdm_state =3D VDM_STATE_READY;
5f2b8d87bca528 drivers/usb/typec/tcpm/tcpm.c Hans de Goede          2020-07=
-24  1367  =

3ed8e1c2ac9914 drivers/usb/typec/tcpm/tcpm.c Badhri Jagan Sridharan 2020-08=
-18  1368  	mod_vdm_delayed_work(port, 0);
f0690a25a140b8 drivers/staging/typec/tcpm.c  Guenter Roeck          2017-04=
-27  1369  }
f0690a25a140b8 drivers/staging/typec/tcpm.c  Guenter Roeck          2017-04=
-27  1370  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============7694187925096357729==--

