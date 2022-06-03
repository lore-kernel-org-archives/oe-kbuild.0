Content-Type: multipart/mixed; boundary="===============0350660901120978083=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [ammarfaizi2-block:google/android/kernel/common/android12-5.4 6455/9999] drivers/dma-buf/dma-buf.c:728 dma_buf_attach() warn: ignoring unreachable code.
Date: Fri, 03 Jun 2022 12:13:42 +0800
Message-ID: <202206031201.CrArhQ6a-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============0350660901120978083==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
TO: Ammar Faizi <ammarfaizi2@gnuweeb.org>

tree:   https://github.com/ammarfaizi2/linux-block google/android/kernel/co=
mmon/android12-5.4
head:   61c005f0f1663789612bbe039932620f51779526
commit: e618a51f562f1f038f31b6a4b4a250c062d70eab [6455/9999] ANDROID: Delet=
e the DMA-BUF attachment sysfs statistics
:::::: branch date: 9 weeks ago
:::::: commit date: 11 months ago
config: x86_64-randconfig-m001 (https://download.01.org/0day-ci/archive/202=
20603/202206031201.CrArhQ6a-lkp(a)intel.com/config)
compiler: gcc-11 (Debian 11.3.0-1) 11.3.0

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

smatch warnings:
drivers/dma-buf/dma-buf.c:728 dma_buf_attach() warn: ignoring unreachable c=
ode.

vim +728 drivers/dma-buf/dma-buf.c

d15bd7ee445d070 drivers/base/dma-buf.c    Sumit Semwal     2011-12-26  677  =

d15bd7ee445d070 drivers/base/dma-buf.c    Sumit Semwal     2011-12-26  678 =
 /**
d15bd7ee445d070 drivers/base/dma-buf.c    Sumit Semwal     2011-12-26  679 =
  * dma_buf_attach - Add the device to dma_buf's attachments list; optional=
ly,
d15bd7ee445d070 drivers/base/dma-buf.c    Sumit Semwal     2011-12-26  680 =
  * calls attach() of dma_buf_ops to allow device-specific attach functiona=
lity
d15bd7ee445d070 drivers/base/dma-buf.c    Sumit Semwal     2011-12-26  681 =
  * @dmabuf:	[in]	buffer to attach device to.
d15bd7ee445d070 drivers/base/dma-buf.c    Sumit Semwal     2011-12-26  682 =
  * @dev:	[in]	device to be attached.
d15bd7ee445d070 drivers/base/dma-buf.c    Sumit Semwal     2011-12-26  683 =
  *
2904a8c1311f028 drivers/dma-buf/dma-buf.c Daniel Vetter    2016-12-09  684 =
  * Returns struct dma_buf_attachment pointer for this attachment. Attachme=
nts
2904a8c1311f028 drivers/dma-buf/dma-buf.c Daniel Vetter    2016-12-09  685 =
  * must be cleaned up by calling dma_buf_detach().
2904a8c1311f028 drivers/dma-buf/dma-buf.c Daniel Vetter    2016-12-09  686 =
  *
2904a8c1311f028 drivers/dma-buf/dma-buf.c Daniel Vetter    2016-12-09  687 =
  * Returns:
2904a8c1311f028 drivers/dma-buf/dma-buf.c Daniel Vetter    2016-12-09  688 =
  *
2904a8c1311f028 drivers/dma-buf/dma-buf.c Daniel Vetter    2016-12-09  689 =
  * A pointer to newly created &dma_buf_attachment on success, or a negative
2904a8c1311f028 drivers/dma-buf/dma-buf.c Daniel Vetter    2016-12-09  690 =
  * error code wrapped into a pointer on failure.
2904a8c1311f028 drivers/dma-buf/dma-buf.c Daniel Vetter    2016-12-09  691 =
  *
2904a8c1311f028 drivers/dma-buf/dma-buf.c Daniel Vetter    2016-12-09  692 =
  * Note that this can fail if the backing storage of @dmabuf is in a place=
 not
2904a8c1311f028 drivers/dma-buf/dma-buf.c Daniel Vetter    2016-12-09  693 =
  * accessible to @dev, and cannot be moved to a more suitable place. This =
is
2904a8c1311f028 drivers/dma-buf/dma-buf.c Daniel Vetter    2016-12-09  694 =
  * indicated with the error code -EBUSY.
d15bd7ee445d070 drivers/base/dma-buf.c    Sumit Semwal     2011-12-26  695 =
  */
d15bd7ee445d070 drivers/base/dma-buf.c    Sumit Semwal     2011-12-26  696 =
 struct dma_buf_attachment *dma_buf_attach(struct dma_buf *dmabuf,
d15bd7ee445d070 drivers/base/dma-buf.c    Sumit Semwal     2011-12-26  697 =
 					  struct device *dev)
d15bd7ee445d070 drivers/base/dma-buf.c    Sumit Semwal     2011-12-26  698 =
 {
d15bd7ee445d070 drivers/base/dma-buf.c    Sumit Semwal     2011-12-26  699 =
 	struct dma_buf_attachment *attach;
d15bd7ee445d070 drivers/base/dma-buf.c    Sumit Semwal     2011-12-26  700 =
 	int ret;
d15bd7ee445d070 drivers/base/dma-buf.c    Sumit Semwal     2011-12-26  701  =

d1aa06a1eaf5f75 drivers/base/dma-buf.c    Laurent Pinchart 2012-01-26  702 =
 	if (WARN_ON(!dmabuf || !dev))
d15bd7ee445d070 drivers/base/dma-buf.c    Sumit Semwal     2011-12-26  703 =
 		return ERR_PTR(-EINVAL);
d15bd7ee445d070 drivers/base/dma-buf.c    Sumit Semwal     2011-12-26  704  =

db7942b6292306a drivers/dma-buf/dma-buf.c Markus Elfring   2017-05-08  705 =
 	attach =3D kzalloc(sizeof(*attach), GFP_KERNEL);
34d84ec4881d134 drivers/dma-buf/dma-buf.c Markus Elfring   2017-05-08  706 =
 	if (!attach)
a9fbc3b73127efb drivers/base/dma-buf.c    Laurent Pinchart 2012-01-26  707 =
 		return ERR_PTR(-ENOMEM);
d15bd7ee445d070 drivers/base/dma-buf.c    Sumit Semwal     2011-12-26  708  =

d15bd7ee445d070 drivers/base/dma-buf.c    Sumit Semwal     2011-12-26  709 =
 	attach->dev =3D dev;
d15bd7ee445d070 drivers/base/dma-buf.c    Sumit Semwal     2011-12-26  710 =
 	attach->dmabuf =3D dmabuf;
2ed9201bdd9a8e4 drivers/base/dma-buf.c    Laurent Pinchart 2012-01-26  711  =

2ed9201bdd9a8e4 drivers/base/dma-buf.c    Laurent Pinchart 2012-01-26  712 =
 	mutex_lock(&dmabuf->lock);
2ed9201bdd9a8e4 drivers/base/dma-buf.c    Laurent Pinchart 2012-01-26  713  =

d15bd7ee445d070 drivers/base/dma-buf.c    Sumit Semwal     2011-12-26  714 =
 	if (dmabuf->ops->attach) {
a19741e5e5a9f1f drivers/dma-buf/dma-buf.c Christian K=C3=B6nig  2018-05-28 =
 715  		ret =3D dmabuf->ops->attach(dmabuf, attach);
d15bd7ee445d070 drivers/base/dma-buf.c    Sumit Semwal     2011-12-26  716 =
 		if (ret)
d15bd7ee445d070 drivers/base/dma-buf.c    Sumit Semwal     2011-12-26  717 =
 			goto err_attach;
d15bd7ee445d070 drivers/base/dma-buf.c    Sumit Semwal     2011-12-26  718 =
 	}
d15bd7ee445d070 drivers/base/dma-buf.c    Sumit Semwal     2011-12-26  719 =
 	list_add(&attach->node, &dmabuf->attachments);
d15bd7ee445d070 drivers/base/dma-buf.c    Sumit Semwal     2011-12-26  720  =

d15bd7ee445d070 drivers/base/dma-buf.c    Sumit Semwal     2011-12-26  721 =
 	return attach;
d15bd7ee445d070 drivers/base/dma-buf.c    Sumit Semwal     2011-12-26  722  =

d15bd7ee445d070 drivers/base/dma-buf.c    Sumit Semwal     2011-12-26  723 =
 err_attach:
d15bd7ee445d070 drivers/base/dma-buf.c    Sumit Semwal     2011-12-26  724 =
 	kfree(attach);
d15bd7ee445d070 drivers/base/dma-buf.c    Sumit Semwal     2011-12-26  725 =
 	mutex_unlock(&dmabuf->lock);
d15bd7ee445d070 drivers/base/dma-buf.c    Sumit Semwal     2011-12-26  726 =
 	return ERR_PTR(ret);
90935b28546d2cf drivers/dma-buf/dma-buf.c Hridya Valsaraju 2021-02-01  727  =

90935b28546d2cf drivers/dma-buf/dma-buf.c Hridya Valsaraju 2021-02-01 @728 =
 	dma_buf_detach(dmabuf, attach);
90935b28546d2cf drivers/dma-buf/dma-buf.c Hridya Valsaraju 2021-02-01  729 =
 	return ERR_PTR(ret);
d15bd7ee445d070 drivers/base/dma-buf.c    Sumit Semwal     2011-12-26  730 =
 }
d15bd7ee445d070 drivers/base/dma-buf.c    Sumit Semwal     2011-12-26  731 =
 EXPORT_SYMBOL_GPL(dma_buf_attach);
d15bd7ee445d070 drivers/base/dma-buf.c    Sumit Semwal     2011-12-26  732  =


:::::: The code at line 728 was first introduced by commit
:::::: 90935b28546d2cfb7541d76c71e749496f77968b BACKPORT: FROMLIST: dmabuf:=
 Add the capability to expose DMA-BUF stats in sysfs

:::::: TO: Hridya Valsaraju <hridya@google.com>
:::::: CC: Suren Baghdasaryan <surenb@google.com>

-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============0350660901120978083==--

