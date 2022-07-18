Content-Type: multipart/mixed; boundary="===============7958227153353575652=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [pdx86-platform-drivers-x86:review-hans 83/93] drivers/platform/x86/asus-wmi.c:1039:12-13: WARNING opportunity for min()
Date: Mon, 18 Jul 2022 13:29:38 +0800
Message-ID: <202207181336.8QjrXSME-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============7958227153353575652==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
CC: Hans de Goede <hdegoede@redhat.com>
CC: linux-kernel(a)vger.kernel.org
TO: "PaddyKP_Yao" <PaddyKP_Yao@asus.com>
CC: Hans de Goede <hdegoede@redhat.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/pdx86/platform-driv=
ers-x86.git review-hans
head:   7a4a04f4e90d746928501a6d551de87d02c28323
commit: b644c95598adfe2b968e97daee3a890dd2fda84d [83/93] platform/x86: asus=
-wmi: Add mic-mute LED classdev support
:::::: branch date: 15 hours ago
:::::: commit date: 3 days ago
config: x86_64-randconfig-c002 (https://download.01.org/0day-ci/archive/202=
20718/202207181336.8QjrXSME-lkp(a)intel.com/config)
compiler: gcc-11 (Debian 11.3.0-3) 11.3.0

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Julia Lawall <julia.lawall@lip6.fr>


cocci warnings: (new ones prefixed by >>)
>> drivers/platform/x86/asus-wmi.c:1039:12-13: WARNING opportunity for min()

vim +1039 drivers/platform/x86/asus-wmi.c

4c05984459ec55 Maxime Belleng=C3=A9 2017-09-23  1031  =

b644c95598adfe PaddyKP_Yao     2022-07-11  1032  static int micmute_led_set=
(struct led_classdev *led_cdev,
b644c95598adfe PaddyKP_Yao     2022-07-11  1033  			   enum led_brightness =
brightness)
b644c95598adfe PaddyKP_Yao     2022-07-11  1034  {
b644c95598adfe PaddyKP_Yao     2022-07-11  1035  	int state =3D brightness =
!=3D LED_OFF;
b644c95598adfe PaddyKP_Yao     2022-07-11  1036  	int err;
b644c95598adfe PaddyKP_Yao     2022-07-11  1037  =

b644c95598adfe PaddyKP_Yao     2022-07-11  1038  	err =3D asus_wmi_set_devs=
tate(ASUS_WMI_DEVID_MICMUTE_LED, state, NULL);
b644c95598adfe PaddyKP_Yao     2022-07-11 @1039  	return err < 0 ? err : 0;
b644c95598adfe PaddyKP_Yao     2022-07-11  1040  }
b644c95598adfe PaddyKP_Yao     2022-07-11  1041  =


-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============7958227153353575652==--

