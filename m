Content-Type: multipart/mixed; boundary="===============3173279026913098334=="
MIME-Version: 1.0
From: Dan Carpenter <dan.carpenter@oracle.com>
Subject: [alexandrebelloni:rtc-misc 34/39] drivers/rtc/rtc-cros-ec.c:112 cros_ec_rtc_set_time() error: uninitialized symbol 'time'.
Date: Wed, 16 Oct 2019 15:32:14 +0300
Message-ID: <20191016123214.GH21344@kadam>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============3173279026913098334==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

tree:   https://github.com/alexandrebelloni/linux rtc-misc
head:   bb9a5d739ffaf1c6f33d267e865c02b123b4792f
commit: f8d8bea4a97442957ea627754319f0b7a05f399c [34/39] rtc: cros-ec: let =
the core handle rtc range

If you fix the issue, kindly add following tag
Reported-by: kbuild test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

smatch warnings:
drivers/rtc/rtc-cros-ec.c:112 cros_ec_rtc_set_time() error: uninitialized s=
ymbol 'time'.

# https://github.com/alexandrebelloni/linux/commit/f8d8bea4a97442957ea62775=
4319f0b7a05f399c
git remote add alexandrebelloni https://github.com/alexandrebelloni/linux
git remote update alexandrebelloni
git checkout f8d8bea4a97442957ea627754319f0b7a05f399c
vim +/time +112 drivers/rtc/rtc-cros-ec.c

6f2a71a31afd73 Stephen Barber 2017-11-10  104  /* Set the current EC time. =
*/
6f2a71a31afd73 Stephen Barber 2017-11-10  105  static int cros_ec_rtc_set_t=
ime(struct device *dev, struct rtc_time *tm)
6f2a71a31afd73 Stephen Barber 2017-11-10  106  {
6f2a71a31afd73 Stephen Barber 2017-11-10  107  	struct cros_ec_rtc *cros_ec=
_rtc =3D dev_get_drvdata(dev);
6f2a71a31afd73 Stephen Barber 2017-11-10  108  	struct cros_ec_device *cros=
_ec =3D cros_ec_rtc->cros_ec;
6f2a71a31afd73 Stephen Barber 2017-11-10  109  	int ret;
6f2a71a31afd73 Stephen Barber 2017-11-10  110  	time64_t time;
                                                ^^^^^^^^^^^^^
Part of the commit is missing?

6f2a71a31afd73 Stephen Barber 2017-11-10  111  =

6f2a71a31afd73 Stephen Barber 2017-11-10 @112  	ret =3D cros_ec_rtc_set(cro=
s_ec, EC_CMD_RTC_SET_VALUE, (u32)time);
                                                                           =
                          ^^^^^^^^^

6f2a71a31afd73 Stephen Barber 2017-11-10  113  	if (ret < 0) {
6f2a71a31afd73 Stephen Barber 2017-11-10  114  		dev_err(dev, "error settin=
g time: %d\n", ret);
6f2a71a31afd73 Stephen Barber 2017-11-10  115  		return ret;
6f2a71a31afd73 Stephen Barber 2017-11-10  116  	}
6f2a71a31afd73 Stephen Barber 2017-11-10  117  =

6f2a71a31afd73 Stephen Barber 2017-11-10  118  	return 0;
6f2a71a31afd73 Stephen Barber 2017-11-10  119  }

---
0-DAY kernel test infrastructure                Open Source Technology Cent=
er
https://lists.01.org/pipermail/kbuild-all                   Intel Corporati=
on
--===============3173279026913098334==--

