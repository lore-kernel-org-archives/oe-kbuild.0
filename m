Content-Type: multipart/mixed; boundary="===============4836241108245604228=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [usb:usb-testing 56/62] drivers/usb/usbip/vudc_main.c:81 vudc_init() warn: perhaps platform_device_put() was intended here?
Date: Mon, 21 Mar 2022 14:46:55 +0800
Message-ID: <202203211422.O29Hnlo5-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============4836241108245604228==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: linux-usb(a)vger.kernel.org
TO: Randy Dunlap <rdunlap@infradead.org>
CC: "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git usb-=
testing
head:   46d2c20b0b10cf07a2a24b047a09195ba96c84f7
commit: 393dcd1f2b75e50783c805814a96bf6c8e11fe03 [56/62] usb: usbip: elimin=
ate anonymous module_init & module_exit
:::::: branch date: 2 days ago
:::::: commit date: 3 days ago
config: openrisc-randconfig-m031-20220321 (https://download.01.org/0day-ci/=
archive/20220321/202203211422.O29Hnlo5-lkp(a)intel.com/config)
compiler: or1k-linux-gcc (GCC) 11.2.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

smatch warnings:
drivers/usb/usbip/vudc_main.c:81 vudc_init() warn: perhaps platform_device_=
put() was intended here?

vim +81 drivers/usb/usbip/vudc_main.c

80fd9cd52de6a5 Igor Kotrasinski         2016-03-08  30  =

393dcd1f2b75e5 Randy Dunlap             2022-03-16  31  static int __init v=
udc_init(void)
80fd9cd52de6a5 Igor Kotrasinski         2016-03-08  32  {
80fd9cd52de6a5 Igor Kotrasinski         2016-03-08  33  	int retval =3D -EN=
OMEM;
80fd9cd52de6a5 Igor Kotrasinski         2016-03-08  34  	int i;
80fd9cd52de6a5 Igor Kotrasinski         2016-03-08  35  	struct vudc_device=
 *udc_dev =3D NULL, *udc_dev2 =3D NULL;
80fd9cd52de6a5 Igor Kotrasinski         2016-03-08  36  =

80fd9cd52de6a5 Igor Kotrasinski         2016-03-08  37  	if (usb_disabled())
80fd9cd52de6a5 Igor Kotrasinski         2016-03-08  38  		return -ENODEV;
80fd9cd52de6a5 Igor Kotrasinski         2016-03-08  39  =

80fd9cd52de6a5 Igor Kotrasinski         2016-03-08  40  	if (vudc_number < =
1) {
80fd9cd52de6a5 Igor Kotrasinski         2016-03-08  41  		pr_err("Number of=
 emulated UDC must be no less than 1");
80fd9cd52de6a5 Igor Kotrasinski         2016-03-08  42  		return -EINVAL;
80fd9cd52de6a5 Igor Kotrasinski         2016-03-08  43  	}
80fd9cd52de6a5 Igor Kotrasinski         2016-03-08  44  =

80fd9cd52de6a5 Igor Kotrasinski         2016-03-08  45  	retval =3D platfor=
m_driver_register(&vudc_driver);
80fd9cd52de6a5 Igor Kotrasinski         2016-03-08  46  	if (retval < 0)
80fd9cd52de6a5 Igor Kotrasinski         2016-03-08  47  		goto out;
80fd9cd52de6a5 Igor Kotrasinski         2016-03-08  48  =

80fd9cd52de6a5 Igor Kotrasinski         2016-03-08  49  	for (i =3D 0; i < =
vudc_number; i++) {
80fd9cd52de6a5 Igor Kotrasinski         2016-03-08  50  		udc_dev =3D alloc=
_vudc_device(i);
80fd9cd52de6a5 Igor Kotrasinski         2016-03-08  51  		if (!udc_dev) {
80fd9cd52de6a5 Igor Kotrasinski         2016-03-08  52  			retval =3D -ENOM=
EM;
80fd9cd52de6a5 Igor Kotrasinski         2016-03-08  53  			goto cleanup;
80fd9cd52de6a5 Igor Kotrasinski         2016-03-08  54  		}
80fd9cd52de6a5 Igor Kotrasinski         2016-03-08  55  =

80fd9cd52de6a5 Igor Kotrasinski         2016-03-08  56  		retval =3D platfo=
rm_device_add(udc_dev->pdev);
80fd9cd52de6a5 Igor Kotrasinski         2016-03-08  57  		if (retval < 0) {
80fd9cd52de6a5 Igor Kotrasinski         2016-03-08  58  			put_vudc_device(=
udc_dev);
80fd9cd52de6a5 Igor Kotrasinski         2016-03-08  59  			goto cleanup;
80fd9cd52de6a5 Igor Kotrasinski         2016-03-08  60  		}
80fd9cd52de6a5 Igor Kotrasinski         2016-03-08  61  =

80fd9cd52de6a5 Igor Kotrasinski         2016-03-08  62  		list_add_tail(&ud=
c_dev->dev_entry, &vudc_devices);
80fd9cd52de6a5 Igor Kotrasinski         2016-03-08  63  		if (!platform_get=
_drvdata(udc_dev->pdev)) {
80fd9cd52de6a5 Igor Kotrasinski         2016-03-08  64  			/*
80fd9cd52de6a5 Igor Kotrasinski         2016-03-08  65  			 * The udc was a=
dded successfully but its probe
80fd9cd52de6a5 Igor Kotrasinski         2016-03-08  66  			 * function fail=
ed for some reason.
80fd9cd52de6a5 Igor Kotrasinski         2016-03-08  67  			 */
80fd9cd52de6a5 Igor Kotrasinski         2016-03-08  68  			retval =3D -EINV=
AL;
80fd9cd52de6a5 Igor Kotrasinski         2016-03-08  69  			goto cleanup;
80fd9cd52de6a5 Igor Kotrasinski         2016-03-08  70  		}
80fd9cd52de6a5 Igor Kotrasinski         2016-03-08  71  	}
80fd9cd52de6a5 Igor Kotrasinski         2016-03-08  72  	goto out;
80fd9cd52de6a5 Igor Kotrasinski         2016-03-08  73  =

80fd9cd52de6a5 Igor Kotrasinski         2016-03-08  74  cleanup:
80fd9cd52de6a5 Igor Kotrasinski         2016-03-08  75  	list_for_each_entr=
y_safe(udc_dev, udc_dev2, &vudc_devices, dev_entry) {
80fd9cd52de6a5 Igor Kotrasinski         2016-03-08  76  		list_del(&udc_dev=
->dev_entry);
e28fd56ad5273b Shuah Khan (Samsung OSG  2018-10-18  77) 		/*
e28fd56ad5273b Shuah Khan (Samsung OSG  2018-10-18  78) 		 * Just do platfo=
rm_device_del() here, put_vudc_device()
e28fd56ad5273b Shuah Khan (Samsung OSG  2018-10-18  79) 		 * calls the plat=
form_device_put()
e28fd56ad5273b Shuah Khan (Samsung OSG  2018-10-18  80) 		 */
80fd9cd52de6a5 Igor Kotrasinski         2016-03-08 @81  		platform_device_d=
el(udc_dev->pdev);
80fd9cd52de6a5 Igor Kotrasinski         2016-03-08  82  		put_vudc_device(u=
dc_dev);
80fd9cd52de6a5 Igor Kotrasinski         2016-03-08  83  	}
80fd9cd52de6a5 Igor Kotrasinski         2016-03-08  84  =

80fd9cd52de6a5 Igor Kotrasinski         2016-03-08  85  	platform_driver_un=
register(&vudc_driver);
80fd9cd52de6a5 Igor Kotrasinski         2016-03-08  86  out:
80fd9cd52de6a5 Igor Kotrasinski         2016-03-08  87  	return retval;
80fd9cd52de6a5 Igor Kotrasinski         2016-03-08  88  }
393dcd1f2b75e5 Randy Dunlap             2022-03-16  89  module_init(vudc_in=
it);
80fd9cd52de6a5 Igor Kotrasinski         2016-03-08  90  =


:::::: The code at line 81 was first introduced by commit
:::::: 80fd9cd52de6a5fb263b3bdcb8bd8982dc50a070 usbip: vudc: Add VUDC main =
file

:::::: TO: Igor Kotrasinski <i.kotrasinsk@samsung.com>
:::::: CC: Greg Kroah-Hartman <gregkh@linuxfoundation.org>

-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============4836241108245604228==--

