Content-Type: multipart/mixed; boundary="===============4703902371007899656=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/scsi/sg.c:940 sg_ioctl_common() error: double locked 'sfp->rq_list_lock' (orig line 940)
Date: Sat, 24 Oct 2020 03:16:05 +0800
Message-ID: <202010240347.KIMtFIsk-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============4703902371007899656==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: Eric Farman <farman@linux.ibm.com>
CC: Vasily Gorbik <gor@linux.ibm.com>
CC: Heiko Carstens <hca@linux.ibm.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   f9893351acaecf0a414baf9942b48d5bb5c688c6
commit: 114b9df419bf5db097b322ebb03fcf2f502f9380 s390: fix GENERIC_LOCKBREA=
K dependency typo in Kconfig
date:   7 weeks ago
:::::: branch date: 23 hours ago
:::::: commit date: 7 weeks ago
config: s390-randconfig-m031-20201023 (attached as .config)
compiler: s390-linux-gcc (GCC) 9.3.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

New smatch warnings:
drivers/scsi/sg.c:940 sg_ioctl_common() error: double locked 'sfp->rq_list_=
lock' (orig line 940)
drivers/scsi/sg.c:940 sg_ioctl_common() error: double locked 'sfp->rq_list_=
lock' (orig line 940)
net/smc/smc_core.c:603 smc_switch_conns() warn: inconsistent returns 'botto=
m_half'.
net/tipc/node.c:486 tipc_node_create() error: double locked 'n->lock' (orig=
 line 466)

Old smatch warnings:
drivers/scsi/sg.c:484 sg_read() error: we previously assumed 'srp' could be=
 null (see line 470)
drivers/scsi/sg.c:944 sg_ioctl_common() error: double locked 'sfp->rq_list_=
lock' (orig line 940)
net/tipc/node.c:1699 tipc_node_xmit() warn: inconsistent returns 'bottom_ha=
lf'.

vim +940 drivers/scsi/sg.c

fd6c3d5accea8e Arnd Bergmann     2018-08-24   916  =

37b9d1e0017b2d J=C3=B6rn Engel        2012-04-12   917  static long
d320a9551e394c Arnd Bergmann     2019-03-15   918  sg_ioctl_common(struct f=
ile *filp, Sg_device *sdp, Sg_fd *sfp,
d320a9551e394c Arnd Bergmann     2019-03-15   919  		unsigned int cmd_in, v=
oid __user *p)
^1da177e4c3f41 Linus Torvalds    2005-04-16   920  {
^1da177e4c3f41 Linus Torvalds    2005-04-16   921  	int __user *ip =3D p;
176aa9d6ee2db5 Christoph Hellwig 2014-10-11   922  	int result, val, read_o=
nly;
^1da177e4c3f41 Linus Torvalds    2005-04-16   923  	Sg_request *srp;
^1da177e4c3f41 Linus Torvalds    2005-04-16   924  	unsigned long iflags;
^1da177e4c3f41 Linus Torvalds    2005-04-16   925  =

95e159d6dd808b Hannes Reinecke   2014-06-25   926  	SCSI_LOG_TIMEOUT(3, sg_=
printk(KERN_INFO, sdp,
95e159d6dd808b Hannes Reinecke   2014-06-25   927  				   "sg_ioctl: cmd=3D=
0x%x\n", (int) cmd_in));
^1da177e4c3f41 Linus Torvalds    2005-04-16   928  	read_only =3D (O_RDWR !=
=3D (filp->f_flags & O_ACCMODE));
^1da177e4c3f41 Linus Torvalds    2005-04-16   929  =

^1da177e4c3f41 Linus Torvalds    2005-04-16   930  	switch (cmd_in) {
^1da177e4c3f41 Linus Torvalds    2005-04-16   931  	case SG_IO:
cc833acbee9db5 Douglas Gilbert   2014-06-25   932  		if (atomic_read(&sdp->=
detaching))
^1da177e4c3f41 Linus Torvalds    2005-04-16   933  			return -ENODEV;
^1da177e4c3f41 Linus Torvalds    2005-04-16   934  		if (!scsi_block_when_p=
rocessing_errors(sdp->device))
^1da177e4c3f41 Linus Torvalds    2005-04-16   935  			return -ENXIO;
dddbf8d908e89a J=C3=B6rn Engel        2012-04-12   936  		result =3D sg_new=
_write(sfp, filp, p, SZ_SG_IO_HDR,
dddbf8d908e89a J=C3=B6rn Engel        2012-04-12   937  				 1, read_only, =
1, &srp);
^1da177e4c3f41 Linus Torvalds    2005-04-16   938  		if (result < 0)
^1da177e4c3f41 Linus Torvalds    2005-04-16   939  			return result;
3f0c6aba0b65a6 J=C3=B6rn Engel        2012-04-12  @940  		result =3D wait_e=
vent_interruptible(sfp->read_wait,
cc833acbee9db5 Douglas Gilbert   2014-06-25   941  			(srp_done(sfp, srp) |=
| atomic_read(&sdp->detaching)));
cc833acbee9db5 Douglas Gilbert   2014-06-25   942  		if (atomic_read(&sdp->=
detaching))
^1da177e4c3f41 Linus Torvalds    2005-04-16   943  			return -ENODEV;
a2dd3b4cea3357 Tony Battersby    2009-01-20   944  		write_lock_irq(&sfp->r=
q_list_lock);
a2dd3b4cea3357 Tony Battersby    2009-01-20   945  		if (srp->done) {
a2dd3b4cea3357 Tony Battersby    2009-01-20   946  			srp->done =3D 2;
a2dd3b4cea3357 Tony Battersby    2009-01-20   947  			write_unlock_irq(&sfp=
->rq_list_lock);
794c10fa0fa4d1 J=C3=B6rn Engel        2012-04-12   948  			result =3D sg_ne=
w_read(sfp, p, SZ_SG_IO_HDR, srp);
794c10fa0fa4d1 J=C3=B6rn Engel        2012-04-12   949  			return (result <=
 0) ? result : 0;
a2dd3b4cea3357 Tony Battersby    2009-01-20   950  		}
^1da177e4c3f41 Linus Torvalds    2005-04-16   951  		srp->orphan =3D 1;
a2dd3b4cea3357 Tony Battersby    2009-01-20   952  		write_unlock_irq(&sfp-=
>rq_list_lock);
^1da177e4c3f41 Linus Torvalds    2005-04-16   953  		return result;	/* -ERE=
STARTSYS because signal hit process */
^1da177e4c3f41 Linus Torvalds    2005-04-16   954  	case SG_SET_TIMEOUT:
^1da177e4c3f41 Linus Torvalds    2005-04-16   955  		result =3D get_user(va=
l, ip);
^1da177e4c3f41 Linus Torvalds    2005-04-16   956  		if (result)
^1da177e4c3f41 Linus Torvalds    2005-04-16   957  			return result;
^1da177e4c3f41 Linus Torvalds    2005-04-16   958  		if (val < 0)
^1da177e4c3f41 Linus Torvalds    2005-04-16   959  			return -EIO;
f8630bd7e2185d Paul Burton       2016-08-19   960  		if (val >=3D mult_frac=
((s64)INT_MAX, USER_HZ, HZ))
f8630bd7e2185d Paul Burton       2016-08-19   961  			val =3D min_t(s64, mu=
lt_frac((s64)INT_MAX, USER_HZ, HZ),
b9b6e80ad3b117 Paul Burton       2016-08-19   962  				    INT_MAX);
^1da177e4c3f41 Linus Torvalds    2005-04-16   963  		sfp->timeout_user =3D =
val;
f8630bd7e2185d Paul Burton       2016-08-19   964  		sfp->timeout =3D mult_=
frac(val, HZ, USER_HZ);
^1da177e4c3f41 Linus Torvalds    2005-04-16   965  =

^1da177e4c3f41 Linus Torvalds    2005-04-16   966  		return 0;
^1da177e4c3f41 Linus Torvalds    2005-04-16   967  	case SG_GET_TIMEOUT:	/*=
 N.B. User receives timeout as return value */
^1da177e4c3f41 Linus Torvalds    2005-04-16   968  				/* strange ..., for =
backward compatibility */
^1da177e4c3f41 Linus Torvalds    2005-04-16   969  		return sfp->timeout_us=
er;
^1da177e4c3f41 Linus Torvalds    2005-04-16   970  	case SG_SET_FORCE_LOW_D=
MA:
745dfa0d8ec26b Hannes Reinecke   2017-04-07   971  		/*
745dfa0d8ec26b Hannes Reinecke   2017-04-07   972  		 * N.B. This ioctl nev=
er worked properly, but failed to
745dfa0d8ec26b Hannes Reinecke   2017-04-07   973  		 * return an error val=
ue. So returning '0' to keep compability
745dfa0d8ec26b Hannes Reinecke   2017-04-07   974  		 * with legacy applica=
tions.
745dfa0d8ec26b Hannes Reinecke   2017-04-07   975  		 */
^1da177e4c3f41 Linus Torvalds    2005-04-16   976  		return 0;
^1da177e4c3f41 Linus Torvalds    2005-04-16   977  	case SG_GET_LOW_DMA:
745dfa0d8ec26b Hannes Reinecke   2017-04-07   978  		return put_user((int) =
sdp->device->host->unchecked_isa_dma, ip);
^1da177e4c3f41 Linus Torvalds    2005-04-16   979  	case SG_GET_SCSI_ID:
a16a47416d3f4f Al Viro           2019-10-17   980  		{
a16a47416d3f4f Al Viro           2019-10-17   981  			sg_scsi_id_t v;
^1da177e4c3f41 Linus Torvalds    2005-04-16   982  =

cc833acbee9db5 Douglas Gilbert   2014-06-25   983  			if (atomic_read(&sdp-=
>detaching))
^1da177e4c3f41 Linus Torvalds    2005-04-16   984  				return -ENODEV;
a16a47416d3f4f Al Viro           2019-10-17   985  			memset(&v, 0, sizeof(=
v));
a16a47416d3f4f Al Viro           2019-10-17   986  			v.host_no =3D sdp->de=
vice->host->host_no;
a16a47416d3f4f Al Viro           2019-10-17   987  			v.channel =3D sdp->de=
vice->channel;
a16a47416d3f4f Al Viro           2019-10-17   988  			v.scsi_id =3D sdp->de=
vice->id;
a16a47416d3f4f Al Viro           2019-10-17   989  			v.lun =3D sdp->device=
->lun;
a16a47416d3f4f Al Viro           2019-10-17   990  			v.scsi_type =3D sdp->=
device->type;
a16a47416d3f4f Al Viro           2019-10-17   991  			v.h_cmd_per_lun =3D s=
dp->device->host->cmd_per_lun;
a16a47416d3f4f Al Viro           2019-10-17   992  			v.d_queue_depth =3D s=
dp->device->queue_depth;
a16a47416d3f4f Al Viro           2019-10-17   993  			if (copy_to_user(p, &=
v, sizeof(sg_scsi_id_t)))
a16a47416d3f4f Al Viro           2019-10-17   994  				return -EFAULT;
^1da177e4c3f41 Linus Torvalds    2005-04-16   995  			return 0;
^1da177e4c3f41 Linus Torvalds    2005-04-16   996  		}
^1da177e4c3f41 Linus Torvalds    2005-04-16   997  	case SG_SET_FORCE_PACK_=
ID:
^1da177e4c3f41 Linus Torvalds    2005-04-16   998  		result =3D get_user(va=
l, ip);
^1da177e4c3f41 Linus Torvalds    2005-04-16   999  		if (result)
^1da177e4c3f41 Linus Torvalds    2005-04-16  1000  			return result;
^1da177e4c3f41 Linus Torvalds    2005-04-16  1001  		sfp->force_packid =3D =
val ? 1 : 0;
^1da177e4c3f41 Linus Torvalds    2005-04-16  1002  		return 0;
^1da177e4c3f41 Linus Torvalds    2005-04-16  1003  	case SG_GET_PACK_ID:
^1da177e4c3f41 Linus Torvalds    2005-04-16  1004  		read_lock_irqsave(&sfp=
->rq_list_lock, iflags);
109bade9c625c8 Hannes Reinecke   2017-04-07  1005  		list_for_each_entry(sr=
p, &sfp->rq_list, entry) {
^1da177e4c3f41 Linus Torvalds    2005-04-16  1006  			if ((1 =3D=3D srp->do=
ne) && (!srp->sg_io_owned)) {
^1da177e4c3f41 Linus Torvalds    2005-04-16  1007  				read_unlock_irqresto=
re(&sfp->rq_list_lock,
^1da177e4c3f41 Linus Torvalds    2005-04-16  1008  						       iflags);
a16a47416d3f4f Al Viro           2019-10-17  1009  				return put_user(srp-=
>header.pack_id, ip);
^1da177e4c3f41 Linus Torvalds    2005-04-16  1010  			}
^1da177e4c3f41 Linus Torvalds    2005-04-16  1011  		}
^1da177e4c3f41 Linus Torvalds    2005-04-16  1012  		read_unlock_irqrestore=
(&sfp->rq_list_lock, iflags);
a16a47416d3f4f Al Viro           2019-10-17  1013  		return put_user(-1, ip=
);
^1da177e4c3f41 Linus Torvalds    2005-04-16  1014  	case SG_GET_NUM_WAITING:
^1da177e4c3f41 Linus Torvalds    2005-04-16  1015  		read_lock_irqsave(&sfp=
->rq_list_lock, iflags);
109bade9c625c8 Hannes Reinecke   2017-04-07  1016  		val =3D 0;
109bade9c625c8 Hannes Reinecke   2017-04-07  1017  		list_for_each_entry(sr=
p, &sfp->rq_list, entry) {
^1da177e4c3f41 Linus Torvalds    2005-04-16  1018  			if ((1 =3D=3D srp->do=
ne) && (!srp->sg_io_owned))
^1da177e4c3f41 Linus Torvalds    2005-04-16  1019  				++val;
^1da177e4c3f41 Linus Torvalds    2005-04-16  1020  		}
^1da177e4c3f41 Linus Torvalds    2005-04-16  1021  		read_unlock_irqrestore=
(&sfp->rq_list_lock, iflags);
^1da177e4c3f41 Linus Torvalds    2005-04-16  1022  		return put_user(val, i=
p);
^1da177e4c3f41 Linus Torvalds    2005-04-16  1023  	case SG_GET_SG_TABLESIZ=
E:
^1da177e4c3f41 Linus Torvalds    2005-04-16  1024  		return put_user(sdp->s=
g_tablesize, ip);
^1da177e4c3f41 Linus Torvalds    2005-04-16  1025  	case SG_SET_RESERVED_SI=
ZE:
^1da177e4c3f41 Linus Torvalds    2005-04-16  1026  		result =3D get_user(va=
l, ip);
^1da177e4c3f41 Linus Torvalds    2005-04-16  1027  		if (result)
^1da177e4c3f41 Linus Torvalds    2005-04-16  1028  			return result;
^1da177e4c3f41 Linus Torvalds    2005-04-16  1029                  if (val =
< 0)
^1da177e4c3f41 Linus Torvalds    2005-04-16  1030                          =
return -EINVAL;
44ec95425c1d9d Alan Stern        2007-02-20  1031  		val =3D min_t(int, val,
46f69e6a6bbbf3 Akinobu Mita      2014-06-02  1032  			    max_sectors_bytes=
(sdp->device->request_queue));
1bc0eb0446158c Hannes Reinecke   2017-04-07  1033  		mutex_lock(&sfp->f_mut=
ex);
^1da177e4c3f41 Linus Torvalds    2005-04-16  1034  		if (val !=3D sfp->rese=
rve.bufflen) {
1bc0eb0446158c Hannes Reinecke   2017-04-07  1035  			if (sfp->mmap_called =
||
1bc0eb0446158c Hannes Reinecke   2017-04-07  1036  			    sfp->res_in_use) {
1bc0eb0446158c Hannes Reinecke   2017-04-07  1037  				mutex_unlock(&sfp->f=
_mutex);
^1da177e4c3f41 Linus Torvalds    2005-04-16  1038  				return -EBUSY;
1bc0eb0446158c Hannes Reinecke   2017-04-07  1039  			}
1bc0eb0446158c Hannes Reinecke   2017-04-07  1040  =

95e159d6dd808b Hannes Reinecke   2014-06-25  1041  			sg_remove_scat(sfp, &=
sfp->reserve);
^1da177e4c3f41 Linus Torvalds    2005-04-16  1042  			sg_build_reserve(sfp,=
 val);
^1da177e4c3f41 Linus Torvalds    2005-04-16  1043  		}
1bc0eb0446158c Hannes Reinecke   2017-04-07  1044  		mutex_unlock(&sfp->f_m=
utex);
^1da177e4c3f41 Linus Torvalds    2005-04-16  1045  		return 0;
^1da177e4c3f41 Linus Torvalds    2005-04-16  1046  	case SG_GET_RESERVED_SI=
ZE:
44ec95425c1d9d Alan Stern        2007-02-20  1047  		val =3D min_t(int, sfp=
->reserve.bufflen,
46f69e6a6bbbf3 Akinobu Mita      2014-06-02  1048  			    max_sectors_bytes=
(sdp->device->request_queue));
^1da177e4c3f41 Linus Torvalds    2005-04-16  1049  		return put_user(val, i=
p);
^1da177e4c3f41 Linus Torvalds    2005-04-16  1050  	case SG_SET_COMMAND_Q:
^1da177e4c3f41 Linus Torvalds    2005-04-16  1051  		result =3D get_user(va=
l, ip);
^1da177e4c3f41 Linus Torvalds    2005-04-16  1052  		if (result)
^1da177e4c3f41 Linus Torvalds    2005-04-16  1053  			return result;
^1da177e4c3f41 Linus Torvalds    2005-04-16  1054  		sfp->cmd_q =3D val ? 1=
 : 0;
^1da177e4c3f41 Linus Torvalds    2005-04-16  1055  		return 0;
^1da177e4c3f41 Linus Torvalds    2005-04-16  1056  	case SG_GET_COMMAND_Q:
^1da177e4c3f41 Linus Torvalds    2005-04-16  1057  		return put_user((int) =
sfp->cmd_q, ip);
^1da177e4c3f41 Linus Torvalds    2005-04-16  1058  	case SG_SET_KEEP_ORPHAN:
^1da177e4c3f41 Linus Torvalds    2005-04-16  1059  		result =3D get_user(va=
l, ip);
^1da177e4c3f41 Linus Torvalds    2005-04-16  1060  		if (result)
^1da177e4c3f41 Linus Torvalds    2005-04-16  1061  			return result;
^1da177e4c3f41 Linus Torvalds    2005-04-16  1062  		sfp->keep_orphan =3D v=
al;
^1da177e4c3f41 Linus Torvalds    2005-04-16  1063  		return 0;
^1da177e4c3f41 Linus Torvalds    2005-04-16  1064  	case SG_GET_KEEP_ORPHAN:
^1da177e4c3f41 Linus Torvalds    2005-04-16  1065  		return put_user((int) =
sfp->keep_orphan, ip);
^1da177e4c3f41 Linus Torvalds    2005-04-16  1066  	case SG_NEXT_CMD_LEN:
^1da177e4c3f41 Linus Torvalds    2005-04-16  1067  		result =3D get_user(va=
l, ip);
^1da177e4c3f41 Linus Torvalds    2005-04-16  1068  		if (result)
^1da177e4c3f41 Linus Torvalds    2005-04-16  1069  			return result;
bf33f87dd04c37 peter chang       2017-02-15  1070  		if (val > SG_MAX_CDB_S=
IZE)
bf33f87dd04c37 peter chang       2017-02-15  1071  			return -ENOMEM;
^1da177e4c3f41 Linus Torvalds    2005-04-16  1072  		sfp->next_cmd_len =3D =
(val > 0) ? val : 0;
^1da177e4c3f41 Linus Torvalds    2005-04-16  1073  		return 0;
^1da177e4c3f41 Linus Torvalds    2005-04-16  1074  	case SG_GET_VERSION_NUM:
^1da177e4c3f41 Linus Torvalds    2005-04-16  1075  		return put_user(sg_ver=
sion_num, ip);
^1da177e4c3f41 Linus Torvalds    2005-04-16  1076  	case SG_GET_ACCESS_COUN=
T:
^1da177e4c3f41 Linus Torvalds    2005-04-16  1077  		/* faked - we don't ha=
ve a real access count anymore */
^1da177e4c3f41 Linus Torvalds    2005-04-16  1078  		val =3D (sdp->device ?=
 1 : 0);
^1da177e4c3f41 Linus Torvalds    2005-04-16  1079  		return put_user(val, i=
p);
^1da177e4c3f41 Linus Torvalds    2005-04-16  1080  	case SG_GET_REQUEST_TAB=
LE:
fd6c3d5accea8e Arnd Bergmann     2018-08-24  1081  		{
cb59e840838193 Douglas Gilbert   2005-04-02  1082  			sg_req_info_t *rinfo;
cb59e840838193 Douglas Gilbert   2005-04-02  1083  =

6396bb221514d2 Kees Cook         2018-06-12  1084  			rinfo =3D kcalloc(SG_=
MAX_QUEUE, SZ_SG_REQ_INFO,
cb59e840838193 Douglas Gilbert   2005-04-02  1085  					GFP_KERNEL);
cb59e840838193 Douglas Gilbert   2005-04-02  1086  			if (!rinfo)
cb59e840838193 Douglas Gilbert   2005-04-02  1087  				return -ENOMEM;
^1da177e4c3f41 Linus Torvalds    2005-04-16  1088  			read_lock_irqsave(&sf=
p->rq_list_lock, iflags);
4759df905a474d Hannes Reinecke   2017-09-15  1089  			sg_fill_request_table=
(sfp, rinfo);
^1da177e4c3f41 Linus Torvalds    2005-04-16  1090  			read_unlock_irqrestor=
e(&sfp->rq_list_lock, iflags);
fd6c3d5accea8e Arnd Bergmann     2018-08-24  1091  	#ifdef CONFIG_COMPAT
fd6c3d5accea8e Arnd Bergmann     2018-08-24  1092  			if (in_compat_syscall=
())
fd6c3d5accea8e Arnd Bergmann     2018-08-24  1093  				result =3D put_compa=
t_request_table(p, rinfo);
fd6c3d5accea8e Arnd Bergmann     2018-08-24  1094  			else
fd6c3d5accea8e Arnd Bergmann     2018-08-24  1095  	#endif
fd6c3d5accea8e Arnd Bergmann     2018-08-24  1096  				result =3D copy_to_u=
ser(p, rinfo,
cb59e840838193 Douglas Gilbert   2005-04-02  1097  						      SZ_SG_REQ_IN=
FO * SG_MAX_QUEUE);
cb59e840838193 Douglas Gilbert   2005-04-02  1098  			result =3D result ? -=
EFAULT : 0;
cb59e840838193 Douglas Gilbert   2005-04-02  1099  			kfree(rinfo);
cb59e840838193 Douglas Gilbert   2005-04-02  1100  			return result;
^1da177e4c3f41 Linus Torvalds    2005-04-16  1101  		}
^1da177e4c3f41 Linus Torvalds    2005-04-16  1102  	case SG_EMULATED_HOST:
cc833acbee9db5 Douglas Gilbert   2014-06-25  1103  		if (atomic_read(&sdp->=
detaching))
^1da177e4c3f41 Linus Torvalds    2005-04-16  1104  			return -ENODEV;
^1da177e4c3f41 Linus Torvalds    2005-04-16  1105  		return put_user(sdp->d=
evice->host->hostt->emulated, ip);
^1da177e4c3f41 Linus Torvalds    2005-04-16  1106  	case SCSI_IOCTL_SEND_CO=
MMAND:
cc833acbee9db5 Douglas Gilbert   2014-06-25  1107  		if (atomic_read(&sdp->=
detaching))
^1da177e4c3f41 Linus Torvalds    2005-04-16  1108  			return -ENODEV;
e915e872ed921d Al Viro           2008-09-02  1109  		return sg_scsi_ioctl(s=
dp->device->request_queue, NULL, filp->f_mode, p);
^1da177e4c3f41 Linus Torvalds    2005-04-16  1110  	case SG_SET_DEBUG:
^1da177e4c3f41 Linus Torvalds    2005-04-16  1111  		result =3D get_user(va=
l, ip);
^1da177e4c3f41 Linus Torvalds    2005-04-16  1112  		if (result)
^1da177e4c3f41 Linus Torvalds    2005-04-16  1113  			return result;
^1da177e4c3f41 Linus Torvalds    2005-04-16  1114  		sdp->sgdebug =3D (char=
) val;
^1da177e4c3f41 Linus Torvalds    2005-04-16  1115  		return 0;
44ec95425c1d9d Alan Stern        2007-02-20  1116  	case BLKSECTGET:
46f69e6a6bbbf3 Akinobu Mita      2014-06-02  1117  		return put_user(max_se=
ctors_bytes(sdp->device->request_queue),
44ec95425c1d9d Alan Stern        2007-02-20  1118  				ip);
6da127ad0918f9 Christof Schmitt  2008-01-11  1119  	case BLKTRACESETUP:
6da127ad0918f9 Christof Schmitt  2008-01-11  1120  		return blk_trace_setup=
(sdp->device->request_queue,
6da127ad0918f9 Christof Schmitt  2008-01-11  1121  				       sdp->disk->di=
sk_name,
76e3a19d0691bb Martin Peschke    2009-01-30  1122  				       MKDEV(SCSI_GE=
NERIC_MAJOR, sdp->index),
7475c8ae1b7bfc Bart Van Assche   2017-08-25  1123  				       NULL, p);
6da127ad0918f9 Christof Schmitt  2008-01-11  1124  	case BLKTRACESTART:
6da127ad0918f9 Christof Schmitt  2008-01-11  1125  		return blk_trace_start=
stop(sdp->device->request_queue, 1);
6da127ad0918f9 Christof Schmitt  2008-01-11  1126  	case BLKTRACESTOP:
6da127ad0918f9 Christof Schmitt  2008-01-11  1127  		return blk_trace_start=
stop(sdp->device->request_queue, 0);
6da127ad0918f9 Christof Schmitt  2008-01-11  1128  	case BLKTRACETEARDOWN:
6da127ad0918f9 Christof Schmitt  2008-01-11  1129  		return blk_trace_remov=
e(sdp->device->request_queue);
906d15fbd23c12 Christoph Hellwig 2014-10-11  1130  	case SCSI_IOCTL_GET_IDL=
UN:
906d15fbd23c12 Christoph Hellwig 2014-10-11  1131  	case SCSI_IOCTL_GET_BUS=
_NUMBER:
906d15fbd23c12 Christoph Hellwig 2014-10-11  1132  	case SCSI_IOCTL_PROBE_H=
OST:
906d15fbd23c12 Christoph Hellwig 2014-10-11  1133  	case SG_GET_TRANSFORM:
906d15fbd23c12 Christoph Hellwig 2014-10-11  1134  	case SG_SCSI_RESET:
906d15fbd23c12 Christoph Hellwig 2014-10-11  1135  		if (atomic_read(&sdp->=
detaching))
906d15fbd23c12 Christoph Hellwig 2014-10-11  1136  			return -ENODEV;
906d15fbd23c12 Christoph Hellwig 2014-10-11  1137  		break;
^1da177e4c3f41 Linus Torvalds    2005-04-16  1138  	default:
^1da177e4c3f41 Linus Torvalds    2005-04-16  1139  		if (read_only)
^1da177e4c3f41 Linus Torvalds    2005-04-16  1140  			return -EPERM;	/* don=
't know so take safe approach */
906d15fbd23c12 Christoph Hellwig 2014-10-11  1141  		break;
^1da177e4c3f41 Linus Torvalds    2005-04-16  1142  	}
906d15fbd23c12 Christoph Hellwig 2014-10-11  1143  =

906d15fbd23c12 Christoph Hellwig 2014-10-11  1144  	result =3D scsi_ioctl_b=
lock_when_processing_errors(sdp->device,
906d15fbd23c12 Christoph Hellwig 2014-10-11  1145  			cmd_in, filp->f_flags=
 & O_NDELAY);
906d15fbd23c12 Christoph Hellwig 2014-10-11  1146  	if (result)
906d15fbd23c12 Christoph Hellwig 2014-10-11  1147  		return result;
d320a9551e394c Arnd Bergmann     2019-03-15  1148  =

d320a9551e394c Arnd Bergmann     2019-03-15  1149  	return -ENOIOCTLCMD;
^1da177e4c3f41 Linus Torvalds    2005-04-16  1150  }
^1da177e4c3f41 Linus Torvalds    2005-04-16  1151  =


:::::: The code at line 940 was first introduced by commit
:::::: 3f0c6aba0b65a68013c1e0db1b015f02e6ec24be [SCSI] sg: use wait_event_i=
nterruptible()

:::::: TO: J=C3=B6rn Engel <joern@logfs.org>
:::::: CC: James Bottomley <JBottomley@Parallels.com>

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org

--===============4703902371007899656==
Content-Type: application/gzip
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="config.gz"

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
keIMK5tDsjQsORj5D8aNhRfzUgIA
--===============4703902371007899656==--

