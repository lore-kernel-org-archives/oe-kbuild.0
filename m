Content-Type: multipart/mixed; boundary="===============6409252510851698396=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/hid/hid-ft260.c:374:0: warning: syntax error [syntaxError]
Date: Sat, 11 Dec 2021 11:06:25 +0800
Message-ID: <202112111015.e4RjMAkS-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============6409252510851698396==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: Michael Zaidman <michael.zaidman@gmail.com>
CC: Jiri Kosina <jkosina@suse.cz>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   9e65da135b39cabd82dc2f56b0db526b65a8d690
commit: 6a82582d9fa438045191074856f47165334f2777 HID: ft260: add usb hid to=
 i2c host bridge driver
date:   9 months ago
:::::: branch date: 4 hours ago
:::::: commit date: 9 months ago
compiler: arc-elf-gcc (GCC) 11.2.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


cppcheck warnings: (new ones prefixed by >>)
>> drivers/hid/hid-prodikeys.c:107:9: warning: %u in format string (no. 2) =
requires 'unsigned int' but the argument type is 'signed int'. [invalidPrin=
tfArgType_uint]
    return sprintf(buf, "%u (min:%u, max:%u)n", pk->pm->midi_channel,
           ^
   drivers/hid/hid-prodikeys.c:107:9: warning: %u in format string (no. 3) =
requires 'unsigned int' but the argument type is 'signed int'. [invalidPrin=
tfArgType_uint]
    return sprintf(buf, "%u (min:%u, max:%u)n", pk->pm->midi_channel,
           ^
   drivers/hid/hid-prodikeys.c:144:9: warning: %u in format string (no. 2) =
requires 'unsigned int' but the argument type is 'signed int'. [invalidPrin=
tfArgType_uint]
    return sprintf(buf, "%u (off:%u, max:%u (ms))n", pk->pm->midi_sustain,
           ^
   drivers/hid/hid-prodikeys.c:144:9: warning: %u in format string (no. 3) =
requires 'unsigned int' but the argument type is 'signed int'. [invalidPrin=
tfArgType_uint]
    return sprintf(buf, "%u (off:%u, max:%u (ms))n", pk->pm->midi_sustain,
           ^

cppcheck possible warnings: (new ones prefixed by >>, may not real problems)

>> drivers/hid/hid-prodikeys.c:107:9: warning: %u in format string (no. 2) =
requires 'unsigned int' but the argument type is 'signed int'. [invalidPrin=
tfArgType_uint]
    return sprintf(buf, "%u (min:%u, max:%u)n", pk->pm->midi_channel,
           ^
   drivers/hid/hid-prodikeys.c:107:9: warning: %u in format string (no. 3) =
requires 'unsigned int' but the argument type is 'signed int'. [invalidPrin=
tfArgType_uint]
    return sprintf(buf, "%u (min:%u, max:%u)n", pk->pm->midi_channel,
           ^
   drivers/hid/hid-prodikeys.c:144:9: warning: %u in format string (no. 2) =
requires 'unsigned int' but the argument type is 'signed int'. [invalidPrin=
tfArgType_uint]
    return sprintf(buf, "%u (off:%u, max:%u (ms))n", pk->pm->midi_sustain,
           ^
   drivers/hid/hid-prodikeys.c:144:9: warning: %u in format string (no. 3) =
requires 'unsigned int' but the argument type is 'signed int'. [invalidPrin=
tfArgType_uint]
    return sprintf(buf, "%u (off:%u, max:%u (ms))n", pk->pm->midi_sustain,
           ^
>> drivers/hid/hid-ft260.c:374:0: warning: syntax error [syntaxError]
   =

   ^
--
>> drivers/hid/wacom_sys.c:1781:2: warning: %ld in format string (no. 1) re=
quires 'long' but the argument type is 'unsigned long'. [invalidPrintfArgTy=
pe_sint]
    sprintf(battery->bat_name, "wacom_battery_%ld", n);
    ^

vim +374 drivers/hid/hid-ft260.c

6a82582d9fa438 Michael Zaidman 2021-02-19  351  =

6a82582d9fa438 Michael Zaidman 2021-02-19  352  static int ft260_hid_output=
_report_check_status(struct ft260_device *dev,
6a82582d9fa438 Michael Zaidman 2021-02-19  353  						u8 *data, int len)
6a82582d9fa438 Michael Zaidman 2021-02-19  354  {
6a82582d9fa438 Michael Zaidman 2021-02-19  355  	int ret, usec, try =3D 3;
6a82582d9fa438 Michael Zaidman 2021-02-19  356  	struct hid_device *hdev =
=3D dev->hdev;
6a82582d9fa438 Michael Zaidman 2021-02-19  357  =

6a82582d9fa438 Michael Zaidman 2021-02-19  358  	ret =3D ft260_hid_output_r=
eport(hdev, data, len);
6a82582d9fa438 Michael Zaidman 2021-02-19  359  	if (ret < 0) {
6a82582d9fa438 Michael Zaidman 2021-02-19  360  		hid_err(hdev, "%s: failed=
 to start transfer, ret %d\n",
6a82582d9fa438 Michael Zaidman 2021-02-19  361  			__func__, ret);
6a82582d9fa438 Michael Zaidman 2021-02-19  362  		ft260_i2c_reset(hdev);
6a82582d9fa438 Michael Zaidman 2021-02-19  363  		return ret;
6a82582d9fa438 Michael Zaidman 2021-02-19  364  	}
6a82582d9fa438 Michael Zaidman 2021-02-19  365  =

6a82582d9fa438 Michael Zaidman 2021-02-19  366  	/* transfer time =3D 1 / c=
lock(KHz) * 10 bits * bytes */
6a82582d9fa438 Michael Zaidman 2021-02-19  367  	usec =3D 10000 / dev->cloc=
k * len;
6a82582d9fa438 Michael Zaidman 2021-02-19  368  	usleep_range(usec, usec + =
100);
6a82582d9fa438 Michael Zaidman 2021-02-19  369  	ft260_dbg("wait %d usec, l=
en %d\n", usec, len);
6a82582d9fa438 Michael Zaidman 2021-02-19  370  	do {
6a82582d9fa438 Michael Zaidman 2021-02-19  371  		ret =3D ft260_xfer_status=
(dev);
6a82582d9fa438 Michael Zaidman 2021-02-19  372  		if (ret !=3D -EAGAIN)
6a82582d9fa438 Michael Zaidman 2021-02-19  373  			break;
6a82582d9fa438 Michael Zaidman 2021-02-19 @374  	} while (--try);
6a82582d9fa438 Michael Zaidman 2021-02-19  375  =

6a82582d9fa438 Michael Zaidman 2021-02-19  376  	if (ret =3D=3D 0 || ret =
=3D=3D -EBUSY)
6a82582d9fa438 Michael Zaidman 2021-02-19  377  		return 0;
6a82582d9fa438 Michael Zaidman 2021-02-19  378  =

6a82582d9fa438 Michael Zaidman 2021-02-19  379  	ft260_i2c_reset(hdev);
6a82582d9fa438 Michael Zaidman 2021-02-19  380  	return -EIO;
6a82582d9fa438 Michael Zaidman 2021-02-19  381  }
6a82582d9fa438 Michael Zaidman 2021-02-19  382  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============6409252510851698396==--

