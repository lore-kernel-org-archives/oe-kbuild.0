Content-Type: multipart/mixed; boundary="===============8125183473686231980=="
MIME-Version: 1.0
From: kbuild test robot <lkp@intel.com>
Subject: [linux-platform-drivers-x86:review-andy 11/16] drivers/platform/x86/thinkpad_acpi.c:9017:31: sparse: sparse: dubious: !x & y
Date: Wed, 13 May 2020 05:59:34 +0800
Message-ID: <202005130521.4SgoFoiY%lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============8125183473686231980==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
TO: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

tree:   git://git.infradead.org/linux-platform-drivers-x86 review-andy
head:   b10e72bd695b5224adab14dbbb0315f22ba3a529
commit: 9744746abf7cc8fcf9bd449aecd5e83a4f78e286 [11/16] platform/x86: thin=
kpad_acpi: Use enabled() helper in fan_read()
reproduce:
        # apt-get install sparse
        # sparse version: v0.6.1-191-gc51a0382-dirty
        git checkout 9744746abf7cc8fcf9bd449aecd5e83a4f78e286
        make ARCH=3Dx86_64 allmodconfig
        make C=3D1 CF=3D'-fdiagnostic-prefix -D__CHECK_ENDIAN__'
:::::: branch date: 7 hours ago
:::::: commit date: 7 hours ago

If you fix the issue, kindly add following tag as appropriate
Reported-by: kbuild test robot <lkp@intel.com>


sparse warnings: (new ones prefixed by >>)

>> drivers/platform/x86/thinkpad_acpi.c:9017:31: sparse: sparse: dubious: !=
x & y
   drivers/platform/x86/thinkpad_acpi.c:9026:50: sparse: sparse: dubious: !=
x & y

git remote add linux-platform-drivers-x86 git://git.infradead.org/linux-pla=
tform-drivers-x86
git remote update linux-platform-drivers-x86
git checkout 9744746abf7cc8fcf9bd449aecd5e83a4f78e286
vim +9017 drivers/platform/x86/thinkpad_acpi.c

75700e53cd14cc drivers/misc/thinkpad_acpi.c         Henrique de Moraes Hols=
chuh 2008-10-18  9001  =

887965e6576a78 drivers/platform/x86/thinkpad_acpi.c Alexey Dobriyan        =
     2009-12-15  9002  static int fan_read(struct seq_file *m)
56b6aeb05890f2 drivers/acpi/ibm_acpi.c              Henrique de Moraes Hols=
chuh 2007-03-23  9003  {
56b6aeb05890f2 drivers/acpi/ibm_acpi.c              Henrique de Moraes Hols=
chuh 2007-03-23  9004  	int rc;
56b6aeb05890f2 drivers/acpi/ibm_acpi.c              Henrique de Moraes Hols=
chuh 2007-03-23  9005  	u8 status;
56b6aeb05890f2 drivers/acpi/ibm_acpi.c              Henrique de Moraes Hols=
chuh 2007-03-23  9006  	unsigned int speed =3D 0;
56b6aeb05890f2 drivers/acpi/ibm_acpi.c              Henrique de Moraes Hols=
chuh 2007-03-23  9007  =

56b6aeb05890f2 drivers/acpi/ibm_acpi.c              Henrique de Moraes Hols=
chuh 2007-03-23  9008  	switch (fan_status_access_mode) {
efa27145df34ea drivers/misc/thinkpad_acpi.c         Henrique de Moraes Hols=
chuh 2007-04-21  9009  	case TPACPI_FAN_RD_ACPI_GFAN:
56b6aeb05890f2 drivers/acpi/ibm_acpi.c              Henrique de Moraes Hols=
chuh 2007-03-23  9010  		/* 570, 600e/x, 770e, 770x */
35ff8b9fa90d97 drivers/misc/thinkpad_acpi.c         Henrique de Moraes Hols=
chuh 2008-01-08  9011  		rc =3D fan_get_status_safe(&status);
35ff8b9fa90d97 drivers/misc/thinkpad_acpi.c         Henrique de Moraes Hols=
chuh 2008-01-08  9012  		if (rc < 0)
56b6aeb05890f2 drivers/acpi/ibm_acpi.c              Henrique de Moraes Hols=
chuh 2007-03-23  9013  			return rc;
56b6aeb05890f2 drivers/acpi/ibm_acpi.c              Henrique de Moraes Hols=
chuh 2007-03-23  9014  =

887965e6576a78 drivers/platform/x86/thinkpad_acpi.c Alexey Dobriyan        =
     2009-12-15  9015  		seq_printf(m, "status:\t\t%s\n"
56b6aeb05890f2 drivers/acpi/ibm_acpi.c              Henrique de Moraes Hols=
chuh 2007-03-23  9016  			      "level:\t\t%d\n",
9744746abf7cc8 drivers/platform/x86/thinkpad_acpi.c Andy Shevchenko        =
     2020-05-12 @9017  			      enabled(!!status, 0), status);
56b6aeb05890f2 drivers/acpi/ibm_acpi.c              Henrique de Moraes Hols=
chuh 2007-03-23  9018  		break;
56b6aeb05890f2 drivers/acpi/ibm_acpi.c              Henrique de Moraes Hols=
chuh 2007-03-23  9019  =

efa27145df34ea drivers/misc/thinkpad_acpi.c         Henrique de Moraes Hols=
chuh 2007-04-21  9020  	case TPACPI_FAN_RD_TPEC:
56b6aeb05890f2 drivers/acpi/ibm_acpi.c              Henrique de Moraes Hols=
chuh 2007-03-23  9021  		/* all except 570, 600e/x, 770e, 770x */
35ff8b9fa90d97 drivers/misc/thinkpad_acpi.c         Henrique de Moraes Hols=
chuh 2008-01-08  9022  		rc =3D fan_get_status_safe(&status);
35ff8b9fa90d97 drivers/misc/thinkpad_acpi.c         Henrique de Moraes Hols=
chuh 2008-01-08  9023  		if (rc < 0)
56b6aeb05890f2 drivers/acpi/ibm_acpi.c              Henrique de Moraes Hols=
chuh 2007-03-23  9024  			return rc;
56b6aeb05890f2 drivers/acpi/ibm_acpi.c              Henrique de Moraes Hols=
chuh 2007-03-23  9025  =

9744746abf7cc8 drivers/platform/x86/thinkpad_acpi.c Andy Shevchenko        =
     2020-05-12  9026  		seq_printf(m, "status:\t\t%s\n", enabled(!!status,=
 0));
56b6aeb05890f2 drivers/acpi/ibm_acpi.c              Henrique de Moraes Hols=
chuh 2007-03-23  9027  =

35ff8b9fa90d97 drivers/misc/thinkpad_acpi.c         Henrique de Moraes Hols=
chuh 2008-01-08  9028  		rc =3D fan_get_speed(&speed);
35ff8b9fa90d97 drivers/misc/thinkpad_acpi.c         Henrique de Moraes Hols=
chuh 2008-01-08  9029  		if (rc < 0)
56b6aeb05890f2 drivers/acpi/ibm_acpi.c              Henrique de Moraes Hols=
chuh 2007-03-23  9030  			return rc;
56b6aeb05890f2 drivers/acpi/ibm_acpi.c              Henrique de Moraes Hols=
chuh 2007-03-23  9031  =

887965e6576a78 drivers/platform/x86/thinkpad_acpi.c Alexey Dobriyan        =
     2009-12-15  9032  		seq_printf(m, "speed:\t\t%d\n", speed);
56b6aeb05890f2 drivers/acpi/ibm_acpi.c              Henrique de Moraes Hols=
chuh 2007-03-23  9033  =

efa27145df34ea drivers/misc/thinkpad_acpi.c         Henrique de Moraes Hols=
chuh 2007-04-21  9034  		if (status & TP_EC_FAN_FULLSPEED)
56b6aeb05890f2 drivers/acpi/ibm_acpi.c              Henrique de Moraes Hols=
chuh 2007-03-23  9035  			/* Disengaged mode takes precedence */
887965e6576a78 drivers/platform/x86/thinkpad_acpi.c Alexey Dobriyan        =
     2009-12-15  9036  			seq_printf(m, "level:\t\tdisengaged\n");
efa27145df34ea drivers/misc/thinkpad_acpi.c         Henrique de Moraes Hols=
chuh 2007-04-21  9037  		else if (status & TP_EC_FAN_AUTO)
887965e6576a78 drivers/platform/x86/thinkpad_acpi.c Alexey Dobriyan        =
     2009-12-15  9038  			seq_printf(m, "level:\t\tauto\n");
56b6aeb05890f2 drivers/acpi/ibm_acpi.c              Henrique de Moraes Hols=
chuh 2007-03-23  9039  		else
887965e6576a78 drivers/platform/x86/thinkpad_acpi.c Alexey Dobriyan        =
     2009-12-15  9040  			seq_printf(m, "level:\t\t%d\n", status);
56b6aeb05890f2 drivers/acpi/ibm_acpi.c              Henrique de Moraes Hols=
chuh 2007-03-23  9041  		break;
56b6aeb05890f2 drivers/acpi/ibm_acpi.c              Henrique de Moraes Hols=
chuh 2007-03-23  9042  =

efa27145df34ea drivers/misc/thinkpad_acpi.c         Henrique de Moraes Hols=
chuh 2007-04-21  9043  	case TPACPI_FAN_NONE:
56b6aeb05890f2 drivers/acpi/ibm_acpi.c              Henrique de Moraes Hols=
chuh 2007-03-23  9044  	default:
887965e6576a78 drivers/platform/x86/thinkpad_acpi.c Alexey Dobriyan        =
     2009-12-15  9045  		seq_printf(m, "status:\t\tnot supported\n");
56b6aeb05890f2 drivers/acpi/ibm_acpi.c              Henrique de Moraes Hols=
chuh 2007-03-23  9046  	}
56b6aeb05890f2 drivers/acpi/ibm_acpi.c              Henrique de Moraes Hols=
chuh 2007-03-23  9047  =

efa27145df34ea drivers/misc/thinkpad_acpi.c         Henrique de Moraes Hols=
chuh 2007-04-21  9048  	if (fan_control_commands & TPACPI_FAN_CMD_LEVEL) {
887965e6576a78 drivers/platform/x86/thinkpad_acpi.c Alexey Dobriyan        =
     2009-12-15  9049  		seq_printf(m, "commands:\tlevel <level>");
56b6aeb05890f2 drivers/acpi/ibm_acpi.c              Henrique de Moraes Hols=
chuh 2007-03-23  9050  =

56b6aeb05890f2 drivers/acpi/ibm_acpi.c              Henrique de Moraes Hols=
chuh 2007-03-23  9051  		switch (fan_control_access_mode) {
efa27145df34ea drivers/misc/thinkpad_acpi.c         Henrique de Moraes Hols=
chuh 2007-04-21  9052  		case TPACPI_FAN_WR_ACPI_SFAN:
887965e6576a78 drivers/platform/x86/thinkpad_acpi.c Alexey Dobriyan        =
     2009-12-15  9053  			seq_printf(m, " (<level> is 0-7)\n");
18ad7996e17649 drivers/acpi/ibm_acpi.c              Henrique de Moraes Hols=
chuh 2006-11-24  9054  			break;
18ad7996e17649 drivers/acpi/ibm_acpi.c              Henrique de Moraes Hols=
chuh 2006-11-24  9055  =

18ad7996e17649 drivers/acpi/ibm_acpi.c              Henrique de Moraes Hols=
chuh 2006-11-24  9056  		default:
5cac62ac92689e drivers/platform/x86/thinkpad_acpi.c Andy Shevchenko        =
     2017-05-09  9057  			seq_printf(m, " (<level> is 0-7, auto, disengaged=
, full-speed)\n");
56b6aeb05890f2 drivers/acpi/ibm_acpi.c              Henrique de Moraes Hols=
chuh 2007-03-23  9058  			break;
18ad7996e17649 drivers/acpi/ibm_acpi.c              Henrique de Moraes Hols=
chuh 2006-11-24  9059  		}
56b6aeb05890f2 drivers/acpi/ibm_acpi.c              Henrique de Moraes Hols=
chuh 2007-03-23  9060  	}
56b6aeb05890f2 drivers/acpi/ibm_acpi.c              Henrique de Moraes Hols=
chuh 2007-03-23  9061  =

efa27145df34ea drivers/misc/thinkpad_acpi.c         Henrique de Moraes Hols=
chuh 2007-04-21  9062  	if (fan_control_commands & TPACPI_FAN_CMD_ENABLE)
887965e6576a78 drivers/platform/x86/thinkpad_acpi.c Alexey Dobriyan        =
     2009-12-15  9063  		seq_printf(m, "commands:\tenable, disable\n"
5cac62ac92689e drivers/platform/x86/thinkpad_acpi.c Andy Shevchenko        =
     2017-05-09  9064  			       "commands:\twatchdog <timeout> (<timeout> =
is 0 (off), 1-120 (seconds))\n");
56b6aeb05890f2 drivers/acpi/ibm_acpi.c              Henrique de Moraes Hols=
chuh 2007-03-23  9065  =

efa27145df34ea drivers/misc/thinkpad_acpi.c         Henrique de Moraes Hols=
chuh 2007-04-21  9066  	if (fan_control_commands & TPACPI_FAN_CMD_SPEED)
5cac62ac92689e drivers/platform/x86/thinkpad_acpi.c Andy Shevchenko        =
     2017-05-09  9067  		seq_printf(m, "commands:\tspeed <speed> (<speed> i=
s 0-65535)\n");
56b6aeb05890f2 drivers/acpi/ibm_acpi.c              Henrique de Moraes Hols=
chuh 2007-03-23  9068  =

887965e6576a78 drivers/platform/x86/thinkpad_acpi.c Alexey Dobriyan        =
     2009-12-15  9069  	return 0;
18ad7996e17649 drivers/acpi/ibm_acpi.c              Henrique de Moraes Hols=
chuh 2006-11-24  9070  }
18ad7996e17649 drivers/acpi/ibm_acpi.c              Henrique de Moraes Hols=
chuh 2006-11-24  9071  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============8125183473686231980==--

