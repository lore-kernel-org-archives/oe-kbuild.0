Content-Type: multipart/mixed; boundary="===============4801683046876095811=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: Re: [PATCH 14/20] target: Manual replacement of the deprecated strlcpy() with return values
Date: Tue, 23 Feb 2021 05:12:37 +0800
Message-ID: <202102230523.cKpeiW0k-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============4801683046876095811==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
In-Reply-To: <20210222151231.22572-15-romain.perier@gmail.com>
References: <20210222151231.22572-15-romain.perier@gmail.com>
TO: Romain Perier <romain.perier@gmail.com>
TO: Kees Cook <keescook@chromium.org>
TO: kernel-hardening(a)lists.openwall.com
TO: "Martin K. Petersen" <martin.petersen@oracle.com>
CC: Romain Perier <romain.perier@gmail.com>
CC: linux-scsi(a)vger.kernel.org
CC: target-devel(a)vger.kernel.org
CC: linux-kernel(a)vger.kernel.org

Hi Romain,

Thank you for the patch! Perhaps something to improve:

[auto build test WARNING on s390/features]
[also build test WARNING on cryptodev/master crypto/master driver-core/driv=
er-core-testing linus/master balbi-usb/testing/next v5.11 next-20210222]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/0day-ci/linux/commits/Romain-Perier/Manual-repla=
cement-of-all-strlcpy-in-favor-of-strscpy/20210222-232701
base:   https://git.kernel.org/pub/scm/linux/kernel/git/s390/linux.git feat=
ures
:::::: branch date: 6 hours ago
:::::: commit date: 6 hours ago
compiler: nds32le-linux-gcc (GCC) 9.3.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


cppcheck possible warnings: (new ones prefixed by >>, may not real problems)

>> drivers/target/target_core_configfs.c:1293:15: warning: Possible null po=
inter dereference: buf [nullPointer]
    len =3D strlen(buf);
                 ^
   drivers/target/target_core_configfs.c:1327:19: note: Assignment 'strippe=
d=3DNULL', assigned value is 0
    char *stripped =3D NULL;
                     ^
   drivers/target/target_core_configfs.c:1339:34: note: Calling function 't=
arget_check_inquiry_data', 1st argument 'stripped' value is 0
    ret =3D target_check_inquiry_data(stripped);
                                    ^
   drivers/target/target_core_configfs.c:1293:15: note: Null pointer derefe=
rence
    len =3D strlen(buf);
                 ^

vim +1293 drivers/target/target_core_configfs.c

c66ac9db8d4ad9 Nicholas Bellinger 2010-12-17  1287  =

0322913cab79e4 Alan Adamson       2019-03-01  1288  static ssize_t target_c=
heck_inquiry_data(char *buf)
0322913cab79e4 Alan Adamson       2019-03-01  1289  {
0322913cab79e4 Alan Adamson       2019-03-01  1290  	size_t len;
0322913cab79e4 Alan Adamson       2019-03-01  1291  	int i;
0322913cab79e4 Alan Adamson       2019-03-01  1292  =

0322913cab79e4 Alan Adamson       2019-03-01 @1293  	len =3D strlen(buf);
0322913cab79e4 Alan Adamson       2019-03-01  1294  =

0322913cab79e4 Alan Adamson       2019-03-01  1295  	/*
0322913cab79e4 Alan Adamson       2019-03-01  1296  	 * SPC 4.3.1:
0322913cab79e4 Alan Adamson       2019-03-01  1297  	 * ASCII data fields s=
hall contain only ASCII printable characters
0322913cab79e4 Alan Adamson       2019-03-01  1298  	 * (i.e., code values =
20h to 7Eh) and may be terminated with one or
0322913cab79e4 Alan Adamson       2019-03-01  1299  	 * more ASCII null (00=
h) characters.
0322913cab79e4 Alan Adamson       2019-03-01  1300  	 */
0322913cab79e4 Alan Adamson       2019-03-01  1301  	for (i =3D 0; i < len;=
 i++) {
0322913cab79e4 Alan Adamson       2019-03-01  1302  		if (buf[i] < 0x20 || =
buf[i] > 0x7E) {
0322913cab79e4 Alan Adamson       2019-03-01  1303  			pr_err("Emulated T10=
 Inquiry Data contains non-ASCII-printable characters\n");
0322913cab79e4 Alan Adamson       2019-03-01  1304  			return -EINVAL;
0322913cab79e4 Alan Adamson       2019-03-01  1305  		}
0322913cab79e4 Alan Adamson       2019-03-01  1306  	}
0322913cab79e4 Alan Adamson       2019-03-01  1307  =

0322913cab79e4 Alan Adamson       2019-03-01  1308  	return len;
0322913cab79e4 Alan Adamson       2019-03-01  1309  }
0322913cab79e4 Alan Adamson       2019-03-01  1310  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============4801683046876095811==--

