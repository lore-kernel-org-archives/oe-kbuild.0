Content-Type: multipart/mixed; boundary="===============4693037666383781523=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/platform/surface/surface_aggregator_cdev.c:557 ssam_cdev_read() error: uninitialized symbol 'copied'.
Date: Thu, 13 Jan 2022 00:29:20 +0800
Message-ID: <202201130015.IIWYZYxD-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============4693037666383781523==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: Maximilian Luz <luzmaximilian@gmail.com>
CC: Hans de Goede <hdegoede@redhat.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   daadb3bd0e8d3e317e36bc2c1542e86c528665e5
commit: 776c53c6a448905d8b9b161805b67f82301bfe91 platform/surface: aggregat=
or_cdev: Add support for forwarding events to user-space
date:   7 months ago
:::::: branch date: 15 hours ago
:::::: commit date: 7 months ago
config: x86_64-randconfig-m001 (https://download.01.org/0day-ci/archive/202=
20113/202201130015.IIWYZYxD-lkp(a)intel.com/config)
compiler: gcc-9 (Debian 9.3.0-22) 9.3.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

smatch warnings:
drivers/platform/surface/surface_aggregator_cdev.c:557 ssam_cdev_read() err=
or: uninitialized symbol 'copied'.

vim +/copied +557 drivers/platform/surface/surface_aggregator_cdev.c

776c53c6a44890 Maximilian Luz 2021-06-04  500  =

776c53c6a44890 Maximilian Luz 2021-06-04  501  static ssize_t ssam_cdev_rea=
d(struct file *file, char __user *buf, size_t count, loff_t *offs)
776c53c6a44890 Maximilian Luz 2021-06-04  502  {
776c53c6a44890 Maximilian Luz 2021-06-04  503  	struct ssam_cdev_client *cl=
ient =3D file->private_data;
776c53c6a44890 Maximilian Luz 2021-06-04  504  	struct ssam_cdev *cdev =3D =
client->cdev;
776c53c6a44890 Maximilian Luz 2021-06-04  505  	unsigned int copied;
776c53c6a44890 Maximilian Luz 2021-06-04  506  	int status =3D 0;
776c53c6a44890 Maximilian Luz 2021-06-04  507  =

178f6ab77e617c Maximilian Luz 2020-12-21  508  	if (down_read_killable(&cde=
v->lock))
178f6ab77e617c Maximilian Luz 2020-12-21  509  		return -ERESTARTSYS;
178f6ab77e617c Maximilian Luz 2020-12-21  510  =

776c53c6a44890 Maximilian Luz 2021-06-04  511  	/* Make sure we're not shut=
 down. */
776c53c6a44890 Maximilian Luz 2021-06-04  512  	if (test_bit(SSAM_CDEV_DEVI=
CE_SHUTDOWN_BIT, &cdev->flags)) {
178f6ab77e617c Maximilian Luz 2020-12-21  513  		up_read(&cdev->lock);
178f6ab77e617c Maximilian Luz 2020-12-21  514  		return -ENODEV;
178f6ab77e617c Maximilian Luz 2020-12-21  515  	}
178f6ab77e617c Maximilian Luz 2020-12-21  516  =

776c53c6a44890 Maximilian Luz 2021-06-04  517  	do {
776c53c6a44890 Maximilian Luz 2021-06-04  518  		/* Check availability, wai=
t if necessary. */
776c53c6a44890 Maximilian Luz 2021-06-04  519  		if (kfifo_is_empty(&client=
->buffer)) {
776c53c6a44890 Maximilian Luz 2021-06-04  520  			up_read(&cdev->lock);
776c53c6a44890 Maximilian Luz 2021-06-04  521  =

776c53c6a44890 Maximilian Luz 2021-06-04  522  			if (file->f_flags & O_NON=
BLOCK)
776c53c6a44890 Maximilian Luz 2021-06-04  523  				return -EAGAIN;
178f6ab77e617c Maximilian Luz 2020-12-21  524  =

776c53c6a44890 Maximilian Luz 2021-06-04  525  			status =3D wait_event_int=
erruptible(client->waitq,
776c53c6a44890 Maximilian Luz 2021-06-04  526  							  !kfifo_is_empty(&cl=
ient->buffer) ||
776c53c6a44890 Maximilian Luz 2021-06-04  527  							  test_bit(SSAM_CDEV_=
DEVICE_SHUTDOWN_BIT,
776c53c6a44890 Maximilian Luz 2021-06-04  528  								   &cdev->flags));
776c53c6a44890 Maximilian Luz 2021-06-04  529  			if (status < 0)
776c53c6a44890 Maximilian Luz 2021-06-04  530  				return status;
776c53c6a44890 Maximilian Luz 2021-06-04  531  =

776c53c6a44890 Maximilian Luz 2021-06-04  532  			if (down_read_killable(&c=
dev->lock))
776c53c6a44890 Maximilian Luz 2021-06-04  533  				return -ERESTARTSYS;
776c53c6a44890 Maximilian Luz 2021-06-04  534  =

776c53c6a44890 Maximilian Luz 2021-06-04  535  			/* Need to check that we'=
re not shut down again. */
776c53c6a44890 Maximilian Luz 2021-06-04  536  			if (test_bit(SSAM_CDEV_DE=
VICE_SHUTDOWN_BIT, &cdev->flags)) {
776c53c6a44890 Maximilian Luz 2021-06-04  537  				up_read(&cdev->lock);
776c53c6a44890 Maximilian Luz 2021-06-04  538  				return -ENODEV;
776c53c6a44890 Maximilian Luz 2021-06-04  539  			}
776c53c6a44890 Maximilian Luz 2021-06-04  540  		}
776c53c6a44890 Maximilian Luz 2021-06-04  541  =

776c53c6a44890 Maximilian Luz 2021-06-04  542  		/* Try to read from FIFO. =
*/
776c53c6a44890 Maximilian Luz 2021-06-04  543  		if (mutex_lock_interruptib=
le(&client->read_lock)) {
776c53c6a44890 Maximilian Luz 2021-06-04  544  			up_read(&cdev->lock);
776c53c6a44890 Maximilian Luz 2021-06-04  545  			return -ERESTARTSYS;
776c53c6a44890 Maximilian Luz 2021-06-04  546  		}
776c53c6a44890 Maximilian Luz 2021-06-04  547  =

776c53c6a44890 Maximilian Luz 2021-06-04  548  		status =3D kfifo_to_user(&=
client->buffer, buf, count, &copied);
776c53c6a44890 Maximilian Luz 2021-06-04  549  		mutex_unlock(&client->read=
_lock);
776c53c6a44890 Maximilian Luz 2021-06-04  550  =

776c53c6a44890 Maximilian Luz 2021-06-04  551  		if (status < 0) {
178f6ab77e617c Maximilian Luz 2020-12-21  552  			up_read(&cdev->lock);
178f6ab77e617c Maximilian Luz 2020-12-21  553  			return status;
178f6ab77e617c Maximilian Luz 2020-12-21  554  		}
178f6ab77e617c Maximilian Luz 2020-12-21  555  =

776c53c6a44890 Maximilian Luz 2021-06-04  556  		/* We might not have gotte=
n anything, check this here. */
776c53c6a44890 Maximilian Luz 2021-06-04 @557  		if (copied =3D=3D 0 && (fi=
le->f_flags & O_NONBLOCK)) {
776c53c6a44890 Maximilian Luz 2021-06-04  558  			up_read(&cdev->lock);
776c53c6a44890 Maximilian Luz 2021-06-04  559  			return -EAGAIN;
776c53c6a44890 Maximilian Luz 2021-06-04  560  		}
776c53c6a44890 Maximilian Luz 2021-06-04  561  	} while (copied =3D=3D 0);
776c53c6a44890 Maximilian Luz 2021-06-04  562  =

776c53c6a44890 Maximilian Luz 2021-06-04  563  	up_read(&cdev->lock);
776c53c6a44890 Maximilian Luz 2021-06-04  564  	return copied;
776c53c6a44890 Maximilian Luz 2021-06-04  565  }
776c53c6a44890 Maximilian Luz 2021-06-04  566  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============4693037666383781523==--

