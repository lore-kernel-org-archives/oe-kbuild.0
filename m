Content-Type: multipart/mixed; boundary="===============0663634151721644558=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [xilinx-xlnx:xlnx_rebase_v5.15_LTS 415/1197] drivers/uio/uio_dmabuf.c:163 uio_dmabuf_unmap() warn: iterator used outside loop: 'dbuf_mem'
Date: Sun, 26 Jun 2022 22:28:55 +0800
Message-ID: <202206262245.4Ea8u0Up-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============0663634151721644558==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: linux-arm-kernel(a)lists.infradead.org
TO: Hyun Kwon <hyun.kwon@xilinx.com>
CC: Michal Simek <monstr@monstr.eu>

tree:   https://github.com/Xilinx/linux-xlnx xlnx_rebase_v5.15_LTS
head:   1e67f149fb5eb4f5eb4e0d4f69194eac6d2497d7
commit: b648abcf3cf96c8f2aa1fa5b7f22122c27296496 [415/1197] uio: Add dma-bu=
f import ioctls
:::::: branch date: 6 days ago
:::::: commit date: 5 months ago
config: parisc-randconfig-m031-20220622
compiler: hppa-linux-gcc (GCC) 11.3.0

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

smatch warnings:
drivers/uio/uio_dmabuf.c:163 uio_dmabuf_unmap() warn: iterator used outside=
 loop: 'dbuf_mem'

vim +/dbuf_mem +163 drivers/uio/uio_dmabuf.c

b648abcf3cf96c8 Hyun Kwon 2019-03-04  143  =

b648abcf3cf96c8 Hyun Kwon 2019-03-04  144  long uio_dmabuf_unmap(struct uio=
_device *dev, struct list_head *dbufs,
b648abcf3cf96c8 Hyun Kwon 2019-03-04  145  		      struct mutex *dbufs_lock=
, void __user *user_args)
b648abcf3cf96c8 Hyun Kwon 2019-03-04  146  =

b648abcf3cf96c8 Hyun Kwon 2019-03-04  147  {
b648abcf3cf96c8 Hyun Kwon 2019-03-04  148  	struct uio_dmabuf_args args;
b648abcf3cf96c8 Hyun Kwon 2019-03-04  149  	struct uio_dmabuf_mem *dbuf_mem;
b648abcf3cf96c8 Hyun Kwon 2019-03-04  150  	long ret;
b648abcf3cf96c8 Hyun Kwon 2019-03-04  151  =

b648abcf3cf96c8 Hyun Kwon 2019-03-04  152  	if (copy_from_user(&args, user_=
args, sizeof(args))) {
b648abcf3cf96c8 Hyun Kwon 2019-03-04  153  		ret =3D -EFAULT;
b648abcf3cf96c8 Hyun Kwon 2019-03-04  154  		goto err;
b648abcf3cf96c8 Hyun Kwon 2019-03-04  155  	}
b648abcf3cf96c8 Hyun Kwon 2019-03-04  156  =

b648abcf3cf96c8 Hyun Kwon 2019-03-04  157  	mutex_lock(dbufs_lock);
b648abcf3cf96c8 Hyun Kwon 2019-03-04  158  	list_for_each_entry(dbuf_mem, d=
bufs, list) {
b648abcf3cf96c8 Hyun Kwon 2019-03-04  159  		if (dbuf_mem->dbuf_fd =3D=3D a=
rgs.dbuf_fd)
b648abcf3cf96c8 Hyun Kwon 2019-03-04  160  			break;
b648abcf3cf96c8 Hyun Kwon 2019-03-04  161  	}
b648abcf3cf96c8 Hyun Kwon 2019-03-04  162  =

b648abcf3cf96c8 Hyun Kwon 2019-03-04 @163  	if (dbuf_mem->dbuf_fd !=3D args=
.dbuf_fd) {
b648abcf3cf96c8 Hyun Kwon 2019-03-04  164  		dev_err(dev->dev.parent, "fail=
ed to find the dmabuf (%d)\n",
b648abcf3cf96c8 Hyun Kwon 2019-03-04  165  			args.dbuf_fd);
b648abcf3cf96c8 Hyun Kwon 2019-03-04  166  		ret =3D -EINVAL;
b648abcf3cf96c8 Hyun Kwon 2019-03-04  167  		goto err_unlock;
b648abcf3cf96c8 Hyun Kwon 2019-03-04  168  	}
b648abcf3cf96c8 Hyun Kwon 2019-03-04  169  	list_del(&dbuf_mem->list);
b648abcf3cf96c8 Hyun Kwon 2019-03-04  170  	mutex_unlock(dbufs_lock);
b648abcf3cf96c8 Hyun Kwon 2019-03-04  171  =

b648abcf3cf96c8 Hyun Kwon 2019-03-04  172  	dma_buf_unmap_attachment(dbuf_m=
em->dbuf_attach, dbuf_mem->sgt,
b648abcf3cf96c8 Hyun Kwon 2019-03-04  173  				 dbuf_mem->dir);
b648abcf3cf96c8 Hyun Kwon 2019-03-04  174  	dma_buf_detach(dbuf_mem->dbuf, =
dbuf_mem->dbuf_attach);
b648abcf3cf96c8 Hyun Kwon 2019-03-04  175  	dma_buf_put(dbuf_mem->dbuf);
b648abcf3cf96c8 Hyun Kwon 2019-03-04  176  	kfree(dbuf_mem);
b648abcf3cf96c8 Hyun Kwon 2019-03-04  177  =

b648abcf3cf96c8 Hyun Kwon 2019-03-04  178  	memset(&args, 0x0, sizeof(args)=
);
b648abcf3cf96c8 Hyun Kwon 2019-03-04  179  =

b648abcf3cf96c8 Hyun Kwon 2019-03-04  180  	if (copy_to_user(user_args, &ar=
gs, sizeof(args))) {
b648abcf3cf96c8 Hyun Kwon 2019-03-04  181  		ret =3D -EFAULT;
b648abcf3cf96c8 Hyun Kwon 2019-03-04  182  		goto err;
b648abcf3cf96c8 Hyun Kwon 2019-03-04  183  	}
b648abcf3cf96c8 Hyun Kwon 2019-03-04  184  =

b648abcf3cf96c8 Hyun Kwon 2019-03-04  185  	return 0;
b648abcf3cf96c8 Hyun Kwon 2019-03-04  186  =

b648abcf3cf96c8 Hyun Kwon 2019-03-04  187  err_unlock:
b648abcf3cf96c8 Hyun Kwon 2019-03-04  188  	mutex_unlock(dbufs_lock);
b648abcf3cf96c8 Hyun Kwon 2019-03-04  189  err:
b648abcf3cf96c8 Hyun Kwon 2019-03-04  190  	return ret;
b648abcf3cf96c8 Hyun Kwon 2019-03-04  191  }
b648abcf3cf96c8 Hyun Kwon 2019-03-04  192  =


-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============0663634151721644558==--

