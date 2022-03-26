Content-Type: multipart/mixed; boundary="===============9006651946219077217=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [xilinx-xlnx:xlnx_rebase_v5.15_LTS 415/1029] drivers/uio/uio_dmabuf.c:163:5-13: ERROR: invalid reference to the index variable of the iterator on line 158
Date: Sat, 26 Mar 2022 10:52:36 +0800
Message-ID: <202203261027.FOo8Ipzb-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============9006651946219077217==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: linux-arm-kernel(a)lists.infradead.org
TO: Hyun Kwon <hyun.kwon@xilinx.com>
CC: Michal Simek <monstr@monstr.eu>

tree:   https://github.com/Xilinx/linux-xlnx xlnx_rebase_v5.15_LTS
head:   1870e0fa79a9d58c6748c34550f3ccea0b515933
commit: b648abcf3cf96c8f2aa1fa5b7f22122c27296496 [415/1029] uio: Add dma-bu=
f import ioctls
:::::: branch date: 2 days ago
:::::: commit date: 8 weeks ago
config: i386-randconfig-c021 (https://download.01.org/0day-ci/archive/20220=
326/202203261027.FOo8Ipzb-lkp(a)intel.com/config)
compiler: gcc-9 (Ubuntu 9.4.0-1ubuntu1~20.04.1) 9.4.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Julia Lawall <julia.lawall@lip6.fr>


cocci warnings: (new ones prefixed by >>)
>> drivers/uio/uio_dmabuf.c:163:5-13: ERROR: invalid reference to the index=
 variable of the iterator on line 158

vim +163 drivers/uio/uio_dmabuf.c

b648abcf3cf96c Hyun Kwon 2019-03-04  143  =

b648abcf3cf96c Hyun Kwon 2019-03-04  144  long uio_dmabuf_unmap(struct uio_=
device *dev, struct list_head *dbufs,
b648abcf3cf96c Hyun Kwon 2019-03-04  145  		      struct mutex *dbufs_lock,=
 void __user *user_args)
b648abcf3cf96c Hyun Kwon 2019-03-04  146  =

b648abcf3cf96c Hyun Kwon 2019-03-04  147  {
b648abcf3cf96c Hyun Kwon 2019-03-04  148  	struct uio_dmabuf_args args;
b648abcf3cf96c Hyun Kwon 2019-03-04  149  	struct uio_dmabuf_mem *dbuf_mem;
b648abcf3cf96c Hyun Kwon 2019-03-04  150  	long ret;
b648abcf3cf96c Hyun Kwon 2019-03-04  151  =

b648abcf3cf96c Hyun Kwon 2019-03-04  152  	if (copy_from_user(&args, user_a=
rgs, sizeof(args))) {
b648abcf3cf96c Hyun Kwon 2019-03-04  153  		ret =3D -EFAULT;
b648abcf3cf96c Hyun Kwon 2019-03-04  154  		goto err;
b648abcf3cf96c Hyun Kwon 2019-03-04  155  	}
b648abcf3cf96c Hyun Kwon 2019-03-04  156  =

b648abcf3cf96c Hyun Kwon 2019-03-04  157  	mutex_lock(dbufs_lock);
b648abcf3cf96c Hyun Kwon 2019-03-04 @158  	list_for_each_entry(dbuf_mem, db=
ufs, list) {
b648abcf3cf96c Hyun Kwon 2019-03-04  159  		if (dbuf_mem->dbuf_fd =3D=3D ar=
gs.dbuf_fd)
b648abcf3cf96c Hyun Kwon 2019-03-04  160  			break;
b648abcf3cf96c Hyun Kwon 2019-03-04  161  	}
b648abcf3cf96c Hyun Kwon 2019-03-04  162  =

b648abcf3cf96c Hyun Kwon 2019-03-04 @163  	if (dbuf_mem->dbuf_fd !=3D args.=
dbuf_fd) {
b648abcf3cf96c Hyun Kwon 2019-03-04  164  		dev_err(dev->dev.parent, "faile=
d to find the dmabuf (%d)\n",
b648abcf3cf96c Hyun Kwon 2019-03-04  165  			args.dbuf_fd);
b648abcf3cf96c Hyun Kwon 2019-03-04  166  		ret =3D -EINVAL;
b648abcf3cf96c Hyun Kwon 2019-03-04  167  		goto err_unlock;
b648abcf3cf96c Hyun Kwon 2019-03-04  168  	}
b648abcf3cf96c Hyun Kwon 2019-03-04  169  	list_del(&dbuf_mem->list);
b648abcf3cf96c Hyun Kwon 2019-03-04  170  	mutex_unlock(dbufs_lock);
b648abcf3cf96c Hyun Kwon 2019-03-04  171  =

b648abcf3cf96c Hyun Kwon 2019-03-04  172  	dma_buf_unmap_attachment(dbuf_me=
m->dbuf_attach, dbuf_mem->sgt,
b648abcf3cf96c Hyun Kwon 2019-03-04  173  				 dbuf_mem->dir);
b648abcf3cf96c Hyun Kwon 2019-03-04  174  	dma_buf_detach(dbuf_mem->dbuf, d=
buf_mem->dbuf_attach);
b648abcf3cf96c Hyun Kwon 2019-03-04  175  	dma_buf_put(dbuf_mem->dbuf);
b648abcf3cf96c Hyun Kwon 2019-03-04  176  	kfree(dbuf_mem);
b648abcf3cf96c Hyun Kwon 2019-03-04  177  =

b648abcf3cf96c Hyun Kwon 2019-03-04  178  	memset(&args, 0x0, sizeof(args));
b648abcf3cf96c Hyun Kwon 2019-03-04  179  =

b648abcf3cf96c Hyun Kwon 2019-03-04  180  	if (copy_to_user(user_args, &arg=
s, sizeof(args))) {
b648abcf3cf96c Hyun Kwon 2019-03-04  181  		ret =3D -EFAULT;
b648abcf3cf96c Hyun Kwon 2019-03-04  182  		goto err;
b648abcf3cf96c Hyun Kwon 2019-03-04  183  	}
b648abcf3cf96c Hyun Kwon 2019-03-04  184  =

b648abcf3cf96c Hyun Kwon 2019-03-04  185  	return 0;
b648abcf3cf96c Hyun Kwon 2019-03-04  186  =

b648abcf3cf96c Hyun Kwon 2019-03-04  187  err_unlock:
b648abcf3cf96c Hyun Kwon 2019-03-04  188  	mutex_unlock(dbufs_lock);
b648abcf3cf96c Hyun Kwon 2019-03-04  189  err:
b648abcf3cf96c Hyun Kwon 2019-03-04  190  	return ret;
b648abcf3cf96c Hyun Kwon 2019-03-04  191  }
b648abcf3cf96c Hyun Kwon 2019-03-04  192  =


-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============9006651946219077217==--

