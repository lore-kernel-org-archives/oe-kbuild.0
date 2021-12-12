Content-Type: multipart/mixed; boundary="===============2066759279835399605=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/fsi/fsi-scom.c:314 get_scom() error: uninitialized symbol 'status'.
Date: Sun, 12 Dec 2021 13:36:14 +0800
Message-ID: <202112121337.gwd9DkKN-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============2066759279835399605==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: Joel Stanley <joel@jms.id.au>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   a763d5a5abd65797aec3dd1bf01fe2ccbec32967
commit: f72ddbe1d7b7d0b2a1179a8dded704ed87001351 fsi: scom: Remove retries
date:   6 months ago
:::::: branch date: 5 hours ago
:::::: commit date: 6 months ago
config: i386-randconfig-m021-20211209 (https://download.01.org/0day-ci/arch=
ive/20211212/202112121337.gwd9DkKN-lkp(a)intel.com/config)
compiler: gcc-9 (Debian 9.3.0-22) 9.3.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

smatch warnings:
drivers/fsi/fsi-scom.c:314 get_scom() error: uninitialized symbol 'status'.

vim +/status +314 drivers/fsi/fsi-scom.c

6b293258cded9c Benjamin Herrenschmidt 2018-06-12  303  =

6b293258cded9c Benjamin Herrenschmidt 2018-06-12  304  static int get_scom(=
struct scom_device *scom, uint64_t *value,
6b293258cded9c Benjamin Herrenschmidt 2018-06-12  305  		    uint64_t addr)
6b293258cded9c Benjamin Herrenschmidt 2018-06-12  306  {
f72ddbe1d7b7d0 Joel Stanley           2021-05-27  307  	uint32_t status;
f72ddbe1d7b7d0 Joel Stanley           2021-05-27  308  	int rc;
6b293258cded9c Benjamin Herrenschmidt 2018-06-12  309  =

6b293258cded9c Benjamin Herrenschmidt 2018-06-12  310  	rc =3D raw_get_scom=
(scom, value, addr, &status);
f72ddbe1d7b7d0 Joel Stanley           2021-05-27  311  	if (rc =3D=3D -ENOD=
EV)
6b293258cded9c Benjamin Herrenschmidt 2018-06-12  312  		return rc;
f72ddbe1d7b7d0 Joel Stanley           2021-05-27  313  =

6b293258cded9c Benjamin Herrenschmidt 2018-06-12 @314  	rc =3D handle_fsi2p=
ib_status(scom, status);
f72ddbe1d7b7d0 Joel Stanley           2021-05-27  315  	if (rc)
f72ddbe1d7b7d0 Joel Stanley           2021-05-27  316  		return rc;
f72ddbe1d7b7d0 Joel Stanley           2021-05-27  317  =

f72ddbe1d7b7d0 Joel Stanley           2021-05-27  318  	return handle_pib_s=
tatus(scom,
6b293258cded9c Benjamin Herrenschmidt 2018-06-12  319  				 (status & SCOM_=
STATUS_PIB_RESP_MASK)
6b293258cded9c Benjamin Herrenschmidt 2018-06-12  320  				 >> SCOM_STATUS_=
PIB_RESP_SHIFT);
680ca6dcf5c222 Christopher Bostic     2017-06-06  321  }
680ca6dcf5c222 Christopher Bostic     2017-06-06  322  =


:::::: The code at line 314 was first introduced by commit
:::::: 6b293258cded9c8ee44cce4081d9170d6d1b5f5d fsi: scom: Major overhaul

:::::: TO: Benjamin Herrenschmidt <benh@kernel.crashing.org>
:::::: CC: Benjamin Herrenschmidt <benh@kernel.crashing.org>

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============2066759279835399605==--

