Content-Type: multipart/mixed; boundary="===============5706417206744400366=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [xilinx-xlnx:xlnx_rebase_v5.15 415/907] drivers/uio/uio_dmabuf.c:163:5-13: ERROR: invalid reference to the index variable of the iterator on line 158
Date: Thu, 10 Feb 2022 01:43:40 +0800
Message-ID: <202202100118.ab2HDle0-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============5706417206744400366==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
CC: linux-arm-kernel(a)lists.infradead.org
TO: Hyun Kwon <hyun.kwon@xilinx.com>
CC: Michal Simek <monstr@monstr.eu>

tree:   https://github.com/Xilinx/linux-xlnx xlnx_rebase_v5.15
head:   423a108a01e05e84b59a4c4885c16bf3cd8c90c7
commit: b648abcf3cf96c8f2aa1fa5b7f22122c27296496 [415/907] uio: Add dma-buf=
 import ioctls
:::::: branch date: 8 hours ago
:::::: commit date: 8 days ago
config: i386-randconfig-c021 (https://download.01.org/0day-ci/archive/20220=
210/202202100118.ab2HDle0-lkp(a)intel.com/config)
compiler: gcc-9 (Debian 9.3.0-22) 9.3.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Julia Lawall <julia.lawall@lip6.fr>


cocci warnings: (new ones prefixed by >>)
>> drivers/uio/uio_dmabuf.c:163:5-13: ERROR: invalid reference to the index=
 variable of the iterator on line 158

vim +163 drivers/uio/uio_dmabuf.c

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
b648abcf3cf96c8 Hyun Kwon 2019-03-04 @158  	list_for_each_entry(dbuf_mem, d=
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


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============5706417206744400366==--

