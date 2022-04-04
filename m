Content-Type: multipart/mixed; boundary="===============4431551116014435336=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: Re: [PATCH v10 1/3] drivers: ddcci: add drivers for DDCCI
Date: Mon, 04 Apr 2022 18:19:10 +0800
Message-ID: <202204041828.CKb7heRR-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============4431551116014435336==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
In-Reply-To: <20220403230850.2986-2-yusisamerican@gmail.com>
References: <20220403230850.2986-2-yusisamerican@gmail.com>
TO: Yusuf Khan <yusisamerican@gmail.com>
TO: linux-kernel(a)vger.kernel.org
CC: jasowang(a)redhat.com
CC: mikelley(a)microsoft.com
CC: mst(a)redhat.com
CC: gregkh(a)linuxfoundation.org
CC: javier(a)javigon.com
CC: arnd(a)arndb.de
CC: will(a)kernel.org
CC: axboe(a)kernel.dk
CC: Yusuf Khan <yusisamerican@gmail.com>
CC: Christoph Grenz <christophg+lkml@grenz-bonn.de>

Hi Yusuf,

Thank you for the patch! Perhaps something to improve:

[auto build test WARNING on char-misc/char-misc-testing]
[also build test WARNING on linus/master lee-backlight/for-backlight-next l=
inux/master v5.18-rc1 next-20220404]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/intel-lab-lkp/linux/commits/Yusuf-Khan/drivers-d=
dcci-add-drivers-for-DDCCI/20220404-080905
base:   https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/char-misc.gi=
t 37fd83916da2e4cae03d350015c82a67b1b334c4
:::::: branch date: 10 hours ago
:::::: commit date: 10 hours ago
compiler: mipsel-linux-gcc (GCC) 11.2.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


cppcheck possible warnings: (new ones prefixed by >>, may not real problems)

>> drivers/char/ddcci.c:678:6: warning: Redundant initialization for 'ret'.=
 The initialized value is overwritten before it is read. [redundantInitiali=
zation]
    ret =3D cdev_add(&device->cdev, ddcci_cdev_next, 1);
        ^
   drivers/char/ddcci.c:663:10: note: ret is initialized
    int ret =3D -EINVAL;
            ^
   drivers/char/ddcci.c:678:6: note: ret is overwritten
    ret =3D cdev_add(&device->cdev, ddcci_cdev_next, 1);
        ^
   drivers/char/ddcci.c:1616:7: warning: Redundant initialization for 'ret'=
. The initialized value is overwritten before it is read. [redundantInitial=
ization]
     ret =3D ddcci_detect_device(client, main_addr, 0);
         ^
   drivers/char/ddcci.c:1597:13: note: ret is initialized
    int i, ret =3D -ENODEV, tmp;
               ^
   drivers/char/ddcci.c:1616:7: note: ret is overwritten
     ret =3D ddcci_detect_device(client, main_addr, 0);
         ^

vim +/ret +678 drivers/char/ddcci.c

d2cd44349035e1 Yusuf Khan 2022-04-03  659  =

d2cd44349035e1 Yusuf Khan 2022-04-03  660  /* Set up the character device f=
or a DDC/CI device */
d2cd44349035e1 Yusuf Khan 2022-04-03  661  static int ddcci_setup_char_devi=
ce(struct ddcci_device *device)
d2cd44349035e1 Yusuf Khan 2022-04-03  662  {
d2cd44349035e1 Yusuf Khan 2022-04-03  663  	int ret =3D -EINVAL;
d2cd44349035e1 Yusuf Khan 2022-04-03  664  =

d2cd44349035e1 Yusuf Khan 2022-04-03  665  	/* Check if free minor exists */
d2cd44349035e1 Yusuf Khan 2022-04-03  666  	if (ddcci_cdev_next =3D=3D ddcc=
i_cdev_end) {
d2cd44349035e1 Yusuf Khan 2022-04-03  667  		dev_err(&device->dev, "no free=
 major/minor\n");
d2cd44349035e1 Yusuf Khan 2022-04-03  668  		ret =3D -ENFILE;
d2cd44349035e1 Yusuf Khan 2022-04-03  669  		goto out;
d2cd44349035e1 Yusuf Khan 2022-04-03  670  	}
d2cd44349035e1 Yusuf Khan 2022-04-03  671  =

d2cd44349035e1 Yusuf Khan 2022-04-03  672  	/* Initialize character device =
node */
d2cd44349035e1 Yusuf Khan 2022-04-03  673  	cdev_init(&device->cdev, &ddcci=
_fops);
d2cd44349035e1 Yusuf Khan 2022-04-03  674  	device->cdev.owner =3D THIS_MOD=
ULE;
d2cd44349035e1 Yusuf Khan 2022-04-03  675  =

d2cd44349035e1 Yusuf Khan 2022-04-03  676  	/* Publish char device */
d2cd44349035e1 Yusuf Khan 2022-04-03  677  	device->dev.devt =3D ddcci_cdev=
_next;
d2cd44349035e1 Yusuf Khan 2022-04-03 @678  	ret =3D cdev_add(&device->cdev,=
 ddcci_cdev_next, 1);
d2cd44349035e1 Yusuf Khan 2022-04-03  679  	if (ret) {
d2cd44349035e1 Yusuf Khan 2022-04-03  680  		device->dev.devt =3D 0;
d2cd44349035e1 Yusuf Khan 2022-04-03  681  		goto out;
d2cd44349035e1 Yusuf Khan 2022-04-03  682  	}
d2cd44349035e1 Yusuf Khan 2022-04-03  683  =

d2cd44349035e1 Yusuf Khan 2022-04-03  684  	ddcci_cdev_next++;
d2cd44349035e1 Yusuf Khan 2022-04-03  685  out:
d2cd44349035e1 Yusuf Khan 2022-04-03  686  	return ret;
d2cd44349035e1 Yusuf Khan 2022-04-03  687  }
d2cd44349035e1 Yusuf Khan 2022-04-03  688  =


-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============4431551116014435336==--

