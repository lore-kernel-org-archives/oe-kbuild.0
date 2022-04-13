Content-Type: multipart/mixed; boundary="===============6008989734499158851=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [linux-next:master 1470/3955] drivers/spi/spidev.c:577:13: warning: Uninitialized variable: iter->devt [uninitvar]
Date: Thu, 14 Apr 2022 03:49:15 +0800
Message-ID: <202204140352.HK0e4zhE-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============6008989734499158851==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: Linux Memory Management List <linux-mm@kvack.org>
TO: Jakob Koschel <jakobkoschel@gmail.com>
CC: Mark Brown <broonie@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git=
 master
head:   c97e430ab5539993ab2afc6e80deea80aef9d799
commit: d50d7e91c6e5ccd71f21ba1aec3fef7ee4229fd6 [1470/3955] spi: spidev: r=
eplace usage of found with dedicated list iterator variable
:::::: branch date: 14 hours ago
:::::: commit date: 8 days ago
compiler: nios2-linux-gcc (GCC) 11.2.0
reproduce (cppcheck warning):
        # apt-get install cppcheck
        git checkout d50d7e91c6e5ccd71f21ba1aec3fef7ee4229fd6
        cppcheck --quiet --enable=3Dstyle,performance,portability --templat=
e=3Dgcc FILE

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


cppcheck possible warnings: (new ones prefixed by >>, may not real problems)

>> drivers/spi/spidev.c:577:13: warning: Uninitialized variable: iter->devt=
 [uninitvar]
     if (iter->devt =3D=3D inode->i_rdev) {
               ^

vim +577 drivers/spi/spidev.c

7d48ec3698e7b7 Bernhard Walle    2011-02-03  568  =

814a8d50eb1d88 Andrea Paterniani 2007-05-08  569  static int spidev_open(st=
ruct inode *inode, struct file *filp)
814a8d50eb1d88 Andrea Paterniani 2007-05-08  570  {
d50d7e91c6e5cc Jakob Koschel     2022-03-24  571  	struct spidev_data	*spid=
ev =3D NULL, *iter;
814a8d50eb1d88 Andrea Paterniani 2007-05-08  572  	int			status =3D -ENXIO;
814a8d50eb1d88 Andrea Paterniani 2007-05-08  573  =

814a8d50eb1d88 Andrea Paterniani 2007-05-08  574  	mutex_lock(&device_list_=
lock);
814a8d50eb1d88 Andrea Paterniani 2007-05-08  575  =

d50d7e91c6e5cc Jakob Koschel     2022-03-24  576  	list_for_each_entry(iter=
, &device_list, device_entry) {
d50d7e91c6e5cc Jakob Koschel     2022-03-24 @577  		if (iter->devt =3D=3D i=
node->i_rdev) {
814a8d50eb1d88 Andrea Paterniani 2007-05-08  578  			status =3D 0;
d50d7e91c6e5cc Jakob Koschel     2022-03-24  579  			spidev =3D iter;
814a8d50eb1d88 Andrea Paterniani 2007-05-08  580  			break;
814a8d50eb1d88 Andrea Paterniani 2007-05-08  581  		}
814a8d50eb1d88 Andrea Paterniani 2007-05-08  582  	}
865f6d1974ddd9 Ray Jui           2014-10-09  583  =

d50d7e91c6e5cc Jakob Koschel     2022-03-24  584  	if (!spidev) {
865f6d1974ddd9 Ray Jui           2014-10-09  585  		pr_debug("spidev: nothi=
ng for minor %d\n", iminor(inode));
865f6d1974ddd9 Ray Jui           2014-10-09  586  		goto err_find_dev;
865f6d1974ddd9 Ray Jui           2014-10-09  587  	}
865f6d1974ddd9 Ray Jui           2014-10-09  588  =

865f6d1974ddd9 Ray Jui           2014-10-09  589  	if (!spidev->tx_buffer) {
865f6d1974ddd9 Ray Jui           2014-10-09  590  		spidev->tx_buffer =3D k=
malloc(bufsiz, GFP_KERNEL);
865f6d1974ddd9 Ray Jui           2014-10-09  591  		if (!spidev->tx_buffer)=
 {
814a8d50eb1d88 Andrea Paterniani 2007-05-08  592  			dev_dbg(&spidev->spi->=
dev, "open/ENOMEM\n");
814a8d50eb1d88 Andrea Paterniani 2007-05-08  593  			status =3D -ENOMEM;
865f6d1974ddd9 Ray Jui           2014-10-09  594  			goto err_find_dev;
814a8d50eb1d88 Andrea Paterniani 2007-05-08  595  		}
814a8d50eb1d88 Andrea Paterniani 2007-05-08  596  	}
865f6d1974ddd9 Ray Jui           2014-10-09  597  =

865f6d1974ddd9 Ray Jui           2014-10-09  598  	if (!spidev->rx_buffer) {
865f6d1974ddd9 Ray Jui           2014-10-09  599  		spidev->rx_buffer =3D k=
malloc(bufsiz, GFP_KERNEL);
865f6d1974ddd9 Ray Jui           2014-10-09  600  		if (!spidev->rx_buffer)=
 {
865f6d1974ddd9 Ray Jui           2014-10-09  601  			dev_dbg(&spidev->spi->=
dev, "open/ENOMEM\n");
865f6d1974ddd9 Ray Jui           2014-10-09  602  			status =3D -ENOMEM;
865f6d1974ddd9 Ray Jui           2014-10-09  603  			goto err_alloc_rx_buf;
865f6d1974ddd9 Ray Jui           2014-10-09  604  		}
865f6d1974ddd9 Ray Jui           2014-10-09  605  	}
865f6d1974ddd9 Ray Jui           2014-10-09  606  =

814a8d50eb1d88 Andrea Paterniani 2007-05-08  607  	spidev->users++;
814a8d50eb1d88 Andrea Paterniani 2007-05-08  608  	filp->private_data =3D s=
pidev;
c5bf68fe0c86a5 Kirill Smelkov    2019-03-26  609  	stream_open(inode, filp);
814a8d50eb1d88 Andrea Paterniani 2007-05-08  610  =

865f6d1974ddd9 Ray Jui           2014-10-09  611  	mutex_unlock(&device_lis=
t_lock);
865f6d1974ddd9 Ray Jui           2014-10-09  612  	return 0;
865f6d1974ddd9 Ray Jui           2014-10-09  613  =

865f6d1974ddd9 Ray Jui           2014-10-09  614  err_alloc_rx_buf:
865f6d1974ddd9 Ray Jui           2014-10-09  615  	kfree(spidev->tx_buffer);
865f6d1974ddd9 Ray Jui           2014-10-09  616  	spidev->tx_buffer =3D NU=
LL;
865f6d1974ddd9 Ray Jui           2014-10-09  617  err_find_dev:
814a8d50eb1d88 Andrea Paterniani 2007-05-08  618  	mutex_unlock(&device_lis=
t_lock);
814a8d50eb1d88 Andrea Paterniani 2007-05-08  619  	return status;
814a8d50eb1d88 Andrea Paterniani 2007-05-08  620  }
814a8d50eb1d88 Andrea Paterniani 2007-05-08  621  =


-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============6008989734499158851==--

