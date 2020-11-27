Content-Type: multipart/mixed; boundary="===============3499500174007130656=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/usb/chipidea/ci_hdrc_imx.c:622:9: warning: Identical condition 'ret', second condition is always false
Date: Sat, 28 Nov 2020 06:34:51 +0800
Message-ID: <202011280645.4upQKyZR-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============3499500174007130656==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: Peter Chen <peter.chen@nxp.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   99c710c46dfc413b9c8a1a40b463ae1eaca539e5
commit: 71ac680e6339e744d87647a1ca27b2e87dba2eac usb: chipidea: ci_hdrc_imx=
: restore pinctrl
date:   3 months ago
:::::: branch date: 3 hours ago
:::::: commit date: 3 months ago
compiler: or1k-linux-gcc (GCC) 9.3.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


cppcheck possible warnings: (new ones prefixed by >>, may not real problems)

>> drivers/usb/chipidea/udc.c:1915:10: warning: Identical condition 'retval=
', second condition is always false [identicalConditionAfterEarlyExit]
     return retval;
            ^
   drivers/usb/chipidea/udc.c:1907:6: note: first condition
    if (retval)
        ^
   drivers/usb/chipidea/udc.c:1915:10: note: second condition
     return retval;
            ^
   drivers/usb/chipidea/udc.c:1923:9: warning: Identical condition 'retval'=
, second condition is always false [identicalConditionAfterEarlyExit]
    return retval;
           ^
   drivers/usb/chipidea/udc.c:1907:6: note: first condition
    if (retval)
        ^
   drivers/usb/chipidea/udc.c:1923:9: note: second condition
    return retval;
           ^
>> drivers/usb/chipidea/ci_hdrc_imx.c:622:9: warning: Identical condition '=
ret', second condition is always false [identicalConditionAfterEarlyExit]
    return ret;
           ^
   drivers/usb/chipidea/ci_hdrc_imx.c:618:6: note: first condition
    if (ret)
        ^
   drivers/usb/chipidea/ci_hdrc_imx.c:622:9: note: second condition
    return ret;
           ^

vim +/ret +622 drivers/usb/chipidea/ci_hdrc_imx.c

2558c1f53bbbb5 Peter Chen       2014-11-26  597  =

9f644a64884f97 Marcus Folkesson 2018-09-02  598  static int __maybe_unused =
ci_hdrc_imx_suspend(struct device *dev)
2558c1f53bbbb5 Peter Chen       2014-11-26  599  {
6d6531104d2069 Peter Chen       2015-02-11  600  	int ret;
6d6531104d2069 Peter Chen       2015-02-11  601  =

e14db48dfcf3ab Peter Chen       2015-02-11  602  	struct ci_hdrc_imx_data *=
data =3D dev_get_drvdata(dev);
e14db48dfcf3ab Peter Chen       2015-02-11  603  =

e14db48dfcf3ab Peter Chen       2015-02-11  604  	if (data->in_lpm)
e14db48dfcf3ab Peter Chen       2015-02-11  605  		/* The core's suspend do=
esn't run */
e14db48dfcf3ab Peter Chen       2015-02-11  606  		return 0;
e14db48dfcf3ab Peter Chen       2015-02-11  607  =

6d6531104d2069 Peter Chen       2015-02-11  608  	if (device_may_wakeup(dev=
)) {
6d6531104d2069 Peter Chen       2015-02-11  609  		ret =3D imx_usbmisc_set_=
wakeup(data->usbmisc_data, true);
6d6531104d2069 Peter Chen       2015-02-11  610  		if (ret) {
6d6531104d2069 Peter Chen       2015-02-11  611  			dev_err(dev, "usbmisc s=
et_wakeup failed, ret=3D%d\n",
6d6531104d2069 Peter Chen       2015-02-11  612  					ret);
6d6531104d2069 Peter Chen       2015-02-11  613  			return ret;
6d6531104d2069 Peter Chen       2015-02-11  614  		}
6d6531104d2069 Peter Chen       2015-02-11  615  	}
6d6531104d2069 Peter Chen       2015-02-11  616  =

71ac680e6339e7 Peter Chen       2018-11-01  617  	ret =3D imx_controller_su=
spend(dev);
71ac680e6339e7 Peter Chen       2018-11-01  618  	if (ret)
71ac680e6339e7 Peter Chen       2018-11-01  619  		return ret;
71ac680e6339e7 Peter Chen       2018-11-01  620  =

71ac680e6339e7 Peter Chen       2018-11-01  621  	pinctrl_pm_select_sleep_s=
tate(dev);
71ac680e6339e7 Peter Chen       2018-11-01 @622  	return ret;
2558c1f53bbbb5 Peter Chen       2014-11-26  623  }
2558c1f53bbbb5 Peter Chen       2014-11-26  624  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============3499500174007130656==--

