Content-Type: multipart/mixed; boundary="===============0036147489154166068=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/scsi/sg.c:1145 sg_ioctl_common() warn: inconsistent returns 'sfp->rq_list_lock'.
Date: Mon, 09 Nov 2020 19:41:16 +0800
Message-ID: <202011091909.kC8zu7Xf-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============0036147489154166068==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: Arnd Bergmann <arnd@arndb.de>
CC: Ben Hutchings <bwh@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   f8394f232b1eab649ce2df5c5f15b0e528c92091
commit: d320a9551e394cb2d842fd32d28e9805c2a18fbb compat_ioctl: scsi: move i=
octl handling into drivers
date:   10 months ago
:::::: branch date: 12 hours ago
:::::: commit date: 10 months ago
config: ia64-randconfig-m031-20201109 (attached as .config)
compiler: ia64-linux-gcc (GCC) 9.3.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

New smatch warnings:
drivers/scsi/sg.c:1145 sg_ioctl_common() warn: inconsistent returns 'sfp->r=
q_list_lock'.

Old smatch warnings:
drivers/scsi/sg.c:1094 sg_ioctl_common() warn: inconsistent indenting

vim +1145 drivers/scsi/sg.c

fd6c3d5accea8e7 Arnd Bergmann     2018-08-24   912  =

37b9d1e0017b2d8 J=C3=B6rn Engel        2012-04-12   913  static long
d320a9551e394cb Arnd Bergmann     2019-03-15   914  sg_ioctl_common(struct =
file *filp, Sg_device *sdp, Sg_fd *sfp,
d320a9551e394cb Arnd Bergmann     2019-03-15   915  		unsigned int cmd_in, =
void __user *p)
^1da177e4c3f415 Linus Torvalds    2005-04-16   916  {
^1da177e4c3f415 Linus Torvalds    2005-04-16   917  	int __user *ip =3D p;
176aa9d6ee2db58 Christoph Hellwig 2014-10-11   918  	int result, val, read_=
only;
^1da177e4c3f415 Linus Torvalds    2005-04-16   919  	Sg_request *srp;
^1da177e4c3f415 Linus Torvalds    2005-04-16   920  	unsigned long iflags;
^1da177e4c3f415 Linus Torvalds    2005-04-16   921  =

95e159d6dd808b2 Hannes Reinecke   2014-06-25   922  	SCSI_LOG_TIMEOUT(3, sg=
_printk(KERN_INFO, sdp,
95e159d6dd808b2 Hannes Reinecke   2014-06-25   923  				   "sg_ioctl: cmd=
=3D0x%x\n", (int) cmd_in));
^1da177e4c3f415 Linus Torvalds    2005-04-16   924  	read_only =3D (O_RDWR =
!=3D (filp->f_flags & O_ACCMODE));
^1da177e4c3f415 Linus Torvalds    2005-04-16   925  =

^1da177e4c3f415 Linus Torvalds    2005-04-16   926  	switch (cmd_in) {
^1da177e4c3f415 Linus Torvalds    2005-04-16   927  	case SG_IO:
cc833acbee9db5c Douglas Gilbert   2014-06-25   928  		if (atomic_read(&sdp-=
>detaching))
^1da177e4c3f415 Linus Torvalds    2005-04-16   929  			return -ENODEV;
^1da177e4c3f415 Linus Torvalds    2005-04-16   930  		if (!scsi_block_when_=
processing_errors(sdp->device))
^1da177e4c3f415 Linus Torvalds    2005-04-16   931  			return -ENXIO;
dddbf8d908e89af J=C3=B6rn Engel        2012-04-12   932  		result =3D sg_ne=
w_write(sfp, filp, p, SZ_SG_IO_HDR,
dddbf8d908e89af J=C3=B6rn Engel        2012-04-12   933  				 1, read_only,=
 1, &srp);
^1da177e4c3f415 Linus Torvalds    2005-04-16   934  		if (result < 0)
^1da177e4c3f415 Linus Torvalds    2005-04-16   935  			return result;
3f0c6aba0b65a68 J=C3=B6rn Engel        2012-04-12   936  		result =3D wait_=
event_interruptible(sfp->read_wait,
cc833acbee9db5c Douglas Gilbert   2014-06-25   937  			(srp_done(sfp, srp) =
|| atomic_read(&sdp->detaching)));
cc833acbee9db5c Douglas Gilbert   2014-06-25   938  		if (atomic_read(&sdp-=
>detaching))
^1da177e4c3f415 Linus Torvalds    2005-04-16   939  			return -ENODEV;
a2dd3b4cea33571 Tony Battersby    2009-01-20   940  		write_lock_irq(&sfp->=
rq_list_lock);
a2dd3b4cea33571 Tony Battersby    2009-01-20   941  		if (srp->done) {
a2dd3b4cea33571 Tony Battersby    2009-01-20   942  			srp->done =3D 2;
a2dd3b4cea33571 Tony Battersby    2009-01-20   943  			write_unlock_irq(&sf=
p->rq_list_lock);
794c10fa0fa4d17 J=C3=B6rn Engel        2012-04-12   944  			result =3D sg_n=
ew_read(sfp, p, SZ_SG_IO_HDR, srp);
794c10fa0fa4d17 J=C3=B6rn Engel        2012-04-12   945  			return (result =
< 0) ? result : 0;
a2dd3b4cea33571 Tony Battersby    2009-01-20   946  		}
^1da177e4c3f415 Linus Torvalds    2005-04-16   947  		srp->orphan =3D 1;
a2dd3b4cea33571 Tony Battersby    2009-01-20   948  		write_unlock_irq(&sfp=
->rq_list_lock);
^1da177e4c3f415 Linus Torvalds    2005-04-16   949  		return result;	/* -ER=
ESTARTSYS because signal hit process */
^1da177e4c3f415 Linus Torvalds    2005-04-16   950  	case SG_SET_TIMEOUT:
^1da177e4c3f415 Linus Torvalds    2005-04-16   951  		result =3D get_user(v=
al, ip);
^1da177e4c3f415 Linus Torvalds    2005-04-16   952  		if (result)
^1da177e4c3f415 Linus Torvalds    2005-04-16   953  			return result;
^1da177e4c3f415 Linus Torvalds    2005-04-16   954  		if (val < 0)
^1da177e4c3f415 Linus Torvalds    2005-04-16   955  			return -EIO;
f8630bd7e2185d1 Paul Burton       2016-08-19   956  		if (val >=3D mult_fra=
c((s64)INT_MAX, USER_HZ, HZ))
f8630bd7e2185d1 Paul Burton       2016-08-19   957  			val =3D min_t(s64, m=
ult_frac((s64)INT_MAX, USER_HZ, HZ),
b9b6e80ad3b1177 Paul Burton       2016-08-19   958  				    INT_MAX);
^1da177e4c3f415 Linus Torvalds    2005-04-16   959  		sfp->timeout_user =3D=
 val;
f8630bd7e2185d1 Paul Burton       2016-08-19   960  		sfp->timeout =3D mult=
_frac(val, HZ, USER_HZ);
^1da177e4c3f415 Linus Torvalds    2005-04-16   961  =

^1da177e4c3f415 Linus Torvalds    2005-04-16   962  		return 0;
^1da177e4c3f415 Linus Torvalds    2005-04-16   963  	case SG_GET_TIMEOUT:	/=
* N.B. User receives timeout as return value */
^1da177e4c3f415 Linus Torvalds    2005-04-16   964  				/* strange ..., for=
 backward compatibility */
^1da177e4c3f415 Linus Torvalds    2005-04-16   965  		return sfp->timeout_u=
ser;
^1da177e4c3f415 Linus Torvalds    2005-04-16   966  	case SG_SET_FORCE_LOW_=
DMA:
745dfa0d8ec26b2 Hannes Reinecke   2017-04-07   967  		/*
745dfa0d8ec26b2 Hannes Reinecke   2017-04-07   968  		 * N.B. This ioctl ne=
ver worked properly, but failed to
745dfa0d8ec26b2 Hannes Reinecke   2017-04-07   969  		 * return an error va=
lue. So returning '0' to keep compability
745dfa0d8ec26b2 Hannes Reinecke   2017-04-07   970  		 * with legacy applic=
ations.
745dfa0d8ec26b2 Hannes Reinecke   2017-04-07   971  		 */
^1da177e4c3f415 Linus Torvalds    2005-04-16   972  		return 0;
^1da177e4c3f415 Linus Torvalds    2005-04-16   973  	case SG_GET_LOW_DMA:
745dfa0d8ec26b2 Hannes Reinecke   2017-04-07   974  		return put_user((int)=
 sdp->device->host->unchecked_isa_dma, ip);
^1da177e4c3f415 Linus Torvalds    2005-04-16   975  	case SG_GET_SCSI_ID:
a16a47416d3f4f7 Al Viro           2019-10-17   976  		{
a16a47416d3f4f7 Al Viro           2019-10-17   977  			sg_scsi_id_t v;
^1da177e4c3f415 Linus Torvalds    2005-04-16   978  =

cc833acbee9db5c Douglas Gilbert   2014-06-25   979  			if (atomic_read(&sdp=
->detaching))
^1da177e4c3f415 Linus Torvalds    2005-04-16   980  				return -ENODEV;
a16a47416d3f4f7 Al Viro           2019-10-17   981  			memset(&v, 0, sizeof=
(v));
a16a47416d3f4f7 Al Viro           2019-10-17   982  			v.host_no =3D sdp->d=
evice->host->host_no;
a16a47416d3f4f7 Al Viro           2019-10-17   983  			v.channel =3D sdp->d=
evice->channel;
a16a47416d3f4f7 Al Viro           2019-10-17   984  			v.scsi_id =3D sdp->d=
evice->id;
a16a47416d3f4f7 Al Viro           2019-10-17   985  			v.lun =3D sdp->devic=
e->lun;
a16a47416d3f4f7 Al Viro           2019-10-17   986  			v.scsi_type =3D sdp-=
>device->type;
a16a47416d3f4f7 Al Viro           2019-10-17   987  			v.h_cmd_per_lun =3D =
sdp->device->host->cmd_per_lun;
a16a47416d3f4f7 Al Viro           2019-10-17   988  			v.d_queue_depth =3D =
sdp->device->queue_depth;
a16a47416d3f4f7 Al Viro           2019-10-17   989  			if (copy_to_user(p, =
&v, sizeof(sg_scsi_id_t)))
a16a47416d3f4f7 Al Viro           2019-10-17   990  				return -EFAULT;
^1da177e4c3f415 Linus Torvalds    2005-04-16   991  			return 0;
^1da177e4c3f415 Linus Torvalds    2005-04-16   992  		}
^1da177e4c3f415 Linus Torvalds    2005-04-16   993  	case SG_SET_FORCE_PACK=
_ID:
^1da177e4c3f415 Linus Torvalds    2005-04-16   994  		result =3D get_user(v=
al, ip);
^1da177e4c3f415 Linus Torvalds    2005-04-16   995  		if (result)
^1da177e4c3f415 Linus Torvalds    2005-04-16   996  			return result;
^1da177e4c3f415 Linus Torvalds    2005-04-16   997  		sfp->force_packid =3D=
 val ? 1 : 0;
^1da177e4c3f415 Linus Torvalds    2005-04-16   998  		return 0;
^1da177e4c3f415 Linus Torvalds    2005-04-16   999  	case SG_GET_PACK_ID:
^1da177e4c3f415 Linus Torvalds    2005-04-16  1000  		read_lock_irqsave(&sf=
p->rq_list_lock, iflags);
109bade9c625c89 Hannes Reinecke   2017-04-07  1001  		list_for_each_entry(s=
rp, &sfp->rq_list, entry) {
^1da177e4c3f415 Linus Torvalds    2005-04-16  1002  			if ((1 =3D=3D srp->d=
one) && (!srp->sg_io_owned)) {
^1da177e4c3f415 Linus Torvalds    2005-04-16  1003  				read_unlock_irqrest=
ore(&sfp->rq_list_lock,
^1da177e4c3f415 Linus Torvalds    2005-04-16  1004  						       iflags);
a16a47416d3f4f7 Al Viro           2019-10-17  1005  				return put_user(srp=
->header.pack_id, ip);
^1da177e4c3f415 Linus Torvalds    2005-04-16  1006  			}
^1da177e4c3f415 Linus Torvalds    2005-04-16  1007  		}
^1da177e4c3f415 Linus Torvalds    2005-04-16  1008  		read_unlock_irqrestor=
e(&sfp->rq_list_lock, iflags);
a16a47416d3f4f7 Al Viro           2019-10-17  1009  		return put_user(-1, i=
p);
^1da177e4c3f415 Linus Torvalds    2005-04-16  1010  	case SG_GET_NUM_WAITIN=
G:
^1da177e4c3f415 Linus Torvalds    2005-04-16  1011  		read_lock_irqsave(&sf=
p->rq_list_lock, iflags);
109bade9c625c89 Hannes Reinecke   2017-04-07  1012  		val =3D 0;
109bade9c625c89 Hannes Reinecke   2017-04-07  1013  		list_for_each_entry(s=
rp, &sfp->rq_list, entry) {
^1da177e4c3f415 Linus Torvalds    2005-04-16  1014  			if ((1 =3D=3D srp->d=
one) && (!srp->sg_io_owned))
^1da177e4c3f415 Linus Torvalds    2005-04-16  1015  				++val;
^1da177e4c3f415 Linus Torvalds    2005-04-16  1016  		}
^1da177e4c3f415 Linus Torvalds    2005-04-16  1017  		read_unlock_irqrestor=
e(&sfp->rq_list_lock, iflags);
^1da177e4c3f415 Linus Torvalds    2005-04-16  1018  		return put_user(val, =
ip);
^1da177e4c3f415 Linus Torvalds    2005-04-16  1019  	case SG_GET_SG_TABLESI=
ZE:
^1da177e4c3f415 Linus Torvalds    2005-04-16  1020  		return put_user(sdp->=
sg_tablesize, ip);
^1da177e4c3f415 Linus Torvalds    2005-04-16  1021  	case SG_SET_RESERVED_S=
IZE:
^1da177e4c3f415 Linus Torvalds    2005-04-16  1022  		result =3D get_user(v=
al, ip);
^1da177e4c3f415 Linus Torvalds    2005-04-16  1023  		if (result)
^1da177e4c3f415 Linus Torvalds    2005-04-16  1024  			return result;
^1da177e4c3f415 Linus Torvalds    2005-04-16  1025                  if (val=
 < 0)
^1da177e4c3f415 Linus Torvalds    2005-04-16  1026                         =
 return -EINVAL;
44ec95425c1d9dc Alan Stern        2007-02-20  1027  		val =3D min_t(int, va=
l,
46f69e6a6bbbf38 Akinobu Mita      2014-06-02  1028  			    max_sectors_byte=
s(sdp->device->request_queue));
1bc0eb0446158cc Hannes Reinecke   2017-04-07  1029  		mutex_lock(&sfp->f_mu=
tex);
^1da177e4c3f415 Linus Torvalds    2005-04-16  1030  		if (val !=3D sfp->res=
erve.bufflen) {
1bc0eb0446158cc Hannes Reinecke   2017-04-07  1031  			if (sfp->mmap_called=
 ||
1bc0eb0446158cc Hannes Reinecke   2017-04-07  1032  			    sfp->res_in_use)=
 {
1bc0eb0446158cc Hannes Reinecke   2017-04-07  1033  				mutex_unlock(&sfp->=
f_mutex);
^1da177e4c3f415 Linus Torvalds    2005-04-16  1034  				return -EBUSY;
1bc0eb0446158cc Hannes Reinecke   2017-04-07  1035  			}
1bc0eb0446158cc Hannes Reinecke   2017-04-07  1036  =

95e159d6dd808b2 Hannes Reinecke   2014-06-25  1037  			sg_remove_scat(sfp, =
&sfp->reserve);
^1da177e4c3f415 Linus Torvalds    2005-04-16  1038  			sg_build_reserve(sfp=
, val);
^1da177e4c3f415 Linus Torvalds    2005-04-16  1039  		}
1bc0eb0446158cc Hannes Reinecke   2017-04-07  1040  		mutex_unlock(&sfp->f_=
mutex);
^1da177e4c3f415 Linus Torvalds    2005-04-16  1041  		return 0;
^1da177e4c3f415 Linus Torvalds    2005-04-16  1042  	case SG_GET_RESERVED_S=
IZE:
44ec95425c1d9dc Alan Stern        2007-02-20  1043  		val =3D min_t(int, sf=
p->reserve.bufflen,
46f69e6a6bbbf38 Akinobu Mita      2014-06-02  1044  			    max_sectors_byte=
s(sdp->device->request_queue));
^1da177e4c3f415 Linus Torvalds    2005-04-16  1045  		return put_user(val, =
ip);
^1da177e4c3f415 Linus Torvalds    2005-04-16  1046  	case SG_SET_COMMAND_Q:
^1da177e4c3f415 Linus Torvalds    2005-04-16  1047  		result =3D get_user(v=
al, ip);
^1da177e4c3f415 Linus Torvalds    2005-04-16  1048  		if (result)
^1da177e4c3f415 Linus Torvalds    2005-04-16  1049  			return result;
^1da177e4c3f415 Linus Torvalds    2005-04-16  1050  		sfp->cmd_q =3D val ? =
1 : 0;
^1da177e4c3f415 Linus Torvalds    2005-04-16  1051  		return 0;
^1da177e4c3f415 Linus Torvalds    2005-04-16  1052  	case SG_GET_COMMAND_Q:
^1da177e4c3f415 Linus Torvalds    2005-04-16  1053  		return put_user((int)=
 sfp->cmd_q, ip);
^1da177e4c3f415 Linus Torvalds    2005-04-16  1054  	case SG_SET_KEEP_ORPHA=
N:
^1da177e4c3f415 Linus Torvalds    2005-04-16  1055  		result =3D get_user(v=
al, ip);
^1da177e4c3f415 Linus Torvalds    2005-04-16  1056  		if (result)
^1da177e4c3f415 Linus Torvalds    2005-04-16  1057  			return result;
^1da177e4c3f415 Linus Torvalds    2005-04-16  1058  		sfp->keep_orphan =3D =
val;
^1da177e4c3f415 Linus Torvalds    2005-04-16  1059  		return 0;
^1da177e4c3f415 Linus Torvalds    2005-04-16  1060  	case SG_GET_KEEP_ORPHA=
N:
^1da177e4c3f415 Linus Torvalds    2005-04-16  1061  		return put_user((int)=
 sfp->keep_orphan, ip);
^1da177e4c3f415 Linus Torvalds    2005-04-16  1062  	case SG_NEXT_CMD_LEN:
^1da177e4c3f415 Linus Torvalds    2005-04-16  1063  		result =3D get_user(v=
al, ip);
^1da177e4c3f415 Linus Torvalds    2005-04-16  1064  		if (result)
^1da177e4c3f415 Linus Torvalds    2005-04-16  1065  			return result;
bf33f87dd04c371 peter chang       2017-02-15  1066  		if (val > SG_MAX_CDB_=
SIZE)
bf33f87dd04c371 peter chang       2017-02-15  1067  			return -ENOMEM;
^1da177e4c3f415 Linus Torvalds    2005-04-16  1068  		sfp->next_cmd_len =3D=
 (val > 0) ? val : 0;
^1da177e4c3f415 Linus Torvalds    2005-04-16  1069  		return 0;
^1da177e4c3f415 Linus Torvalds    2005-04-16  1070  	case SG_GET_VERSION_NU=
M:
^1da177e4c3f415 Linus Torvalds    2005-04-16  1071  		return put_user(sg_ve=
rsion_num, ip);
^1da177e4c3f415 Linus Torvalds    2005-04-16  1072  	case SG_GET_ACCESS_COU=
NT:
^1da177e4c3f415 Linus Torvalds    2005-04-16  1073  		/* faked - we don't h=
ave a real access count anymore */
^1da177e4c3f415 Linus Torvalds    2005-04-16  1074  		val =3D (sdp->device =
? 1 : 0);
^1da177e4c3f415 Linus Torvalds    2005-04-16  1075  		return put_user(val, =
ip);
^1da177e4c3f415 Linus Torvalds    2005-04-16  1076  	case SG_GET_REQUEST_TA=
BLE:
fd6c3d5accea8e7 Arnd Bergmann     2018-08-24  1077  		{
cb59e8408381939 Douglas Gilbert   2005-04-02  1078  			sg_req_info_t *rinfo;
cb59e8408381939 Douglas Gilbert   2005-04-02  1079  =

6396bb221514d28 Kees Cook         2018-06-12  1080  			rinfo =3D kcalloc(SG=
_MAX_QUEUE, SZ_SG_REQ_INFO,
cb59e8408381939 Douglas Gilbert   2005-04-02  1081  					GFP_KERNEL);
cb59e8408381939 Douglas Gilbert   2005-04-02  1082  			if (!rinfo)
cb59e8408381939 Douglas Gilbert   2005-04-02  1083  				return -ENOMEM;
^1da177e4c3f415 Linus Torvalds    2005-04-16  1084  			read_lock_irqsave(&s=
fp->rq_list_lock, iflags);
4759df905a474d2 Hannes Reinecke   2017-09-15  1085  			sg_fill_request_tabl=
e(sfp, rinfo);
^1da177e4c3f415 Linus Torvalds    2005-04-16  1086  			read_unlock_irqresto=
re(&sfp->rq_list_lock, iflags);
fd6c3d5accea8e7 Arnd Bergmann     2018-08-24  1087  	#ifdef CONFIG_COMPAT
fd6c3d5accea8e7 Arnd Bergmann     2018-08-24  1088  			if (in_compat_syscal=
l())
fd6c3d5accea8e7 Arnd Bergmann     2018-08-24  1089  				result =3D put_comp=
at_request_table(p, rinfo);
fd6c3d5accea8e7 Arnd Bergmann     2018-08-24  1090  			else
fd6c3d5accea8e7 Arnd Bergmann     2018-08-24  1091  	#endif
fd6c3d5accea8e7 Arnd Bergmann     2018-08-24  1092  				result =3D copy_to_=
user(p, rinfo,
cb59e8408381939 Douglas Gilbert   2005-04-02  1093  						      SZ_SG_REQ_I=
NFO * SG_MAX_QUEUE);
cb59e8408381939 Douglas Gilbert   2005-04-02  1094  			result =3D result ? =
-EFAULT : 0;
cb59e8408381939 Douglas Gilbert   2005-04-02  1095  			kfree(rinfo);
cb59e8408381939 Douglas Gilbert   2005-04-02  1096  			return result;
^1da177e4c3f415 Linus Torvalds    2005-04-16  1097  		}
^1da177e4c3f415 Linus Torvalds    2005-04-16  1098  	case SG_EMULATED_HOST:
cc833acbee9db5c Douglas Gilbert   2014-06-25  1099  		if (atomic_read(&sdp-=
>detaching))
^1da177e4c3f415 Linus Torvalds    2005-04-16  1100  			return -ENODEV;
^1da177e4c3f415 Linus Torvalds    2005-04-16  1101  		return put_user(sdp->=
device->host->hostt->emulated, ip);
^1da177e4c3f415 Linus Torvalds    2005-04-16  1102  	case SCSI_IOCTL_SEND_C=
OMMAND:
cc833acbee9db5c Douglas Gilbert   2014-06-25  1103  		if (atomic_read(&sdp-=
>detaching))
^1da177e4c3f415 Linus Torvalds    2005-04-16  1104  			return -ENODEV;
e915e872ed921d7 Al Viro           2008-09-02  1105  		return sg_scsi_ioctl(=
sdp->device->request_queue, NULL, filp->f_mode, p);
^1da177e4c3f415 Linus Torvalds    2005-04-16  1106  	case SG_SET_DEBUG:
^1da177e4c3f415 Linus Torvalds    2005-04-16  1107  		result =3D get_user(v=
al, ip);
^1da177e4c3f415 Linus Torvalds    2005-04-16  1108  		if (result)
^1da177e4c3f415 Linus Torvalds    2005-04-16  1109  			return result;
^1da177e4c3f415 Linus Torvalds    2005-04-16  1110  		sdp->sgdebug =3D (cha=
r) val;
^1da177e4c3f415 Linus Torvalds    2005-04-16  1111  		return 0;
44ec95425c1d9dc Alan Stern        2007-02-20  1112  	case BLKSECTGET:
46f69e6a6bbbf38 Akinobu Mita      2014-06-02  1113  		return put_user(max_s=
ectors_bytes(sdp->device->request_queue),
44ec95425c1d9dc Alan Stern        2007-02-20  1114  				ip);
6da127ad0918f93 Christof Schmitt  2008-01-11  1115  	case BLKTRACESETUP:
6da127ad0918f93 Christof Schmitt  2008-01-11  1116  		return blk_trace_setu=
p(sdp->device->request_queue,
6da127ad0918f93 Christof Schmitt  2008-01-11  1117  				       sdp->disk->d=
isk_name,
76e3a19d0691bbf Martin Peschke    2009-01-30  1118  				       MKDEV(SCSI_G=
ENERIC_MAJOR, sdp->index),
7475c8ae1b7bfc2 Bart Van Assche   2017-08-25  1119  				       NULL, p);
6da127ad0918f93 Christof Schmitt  2008-01-11  1120  	case BLKTRACESTART:
6da127ad0918f93 Christof Schmitt  2008-01-11  1121  		return blk_trace_star=
tstop(sdp->device->request_queue, 1);
6da127ad0918f93 Christof Schmitt  2008-01-11  1122  	case BLKTRACESTOP:
6da127ad0918f93 Christof Schmitt  2008-01-11  1123  		return blk_trace_star=
tstop(sdp->device->request_queue, 0);
6da127ad0918f93 Christof Schmitt  2008-01-11  1124  	case BLKTRACETEARDOWN:
6da127ad0918f93 Christof Schmitt  2008-01-11  1125  		return blk_trace_remo=
ve(sdp->device->request_queue);
906d15fbd23c126 Christoph Hellwig 2014-10-11  1126  	case SCSI_IOCTL_GET_ID=
LUN:
906d15fbd23c126 Christoph Hellwig 2014-10-11  1127  	case SCSI_IOCTL_GET_BU=
S_NUMBER:
906d15fbd23c126 Christoph Hellwig 2014-10-11  1128  	case SCSI_IOCTL_PROBE_=
HOST:
906d15fbd23c126 Christoph Hellwig 2014-10-11  1129  	case SG_GET_TRANSFORM:
906d15fbd23c126 Christoph Hellwig 2014-10-11  1130  	case SG_SCSI_RESET:
906d15fbd23c126 Christoph Hellwig 2014-10-11  1131  		if (atomic_read(&sdp-=
>detaching))
906d15fbd23c126 Christoph Hellwig 2014-10-11  1132  			return -ENODEV;
906d15fbd23c126 Christoph Hellwig 2014-10-11  1133  		break;
^1da177e4c3f415 Linus Torvalds    2005-04-16  1134  	default:
^1da177e4c3f415 Linus Torvalds    2005-04-16  1135  		if (read_only)
^1da177e4c3f415 Linus Torvalds    2005-04-16  1136  			return -EPERM;	/* do=
n't know so take safe approach */
906d15fbd23c126 Christoph Hellwig 2014-10-11  1137  		break;
^1da177e4c3f415 Linus Torvalds    2005-04-16  1138  	}
906d15fbd23c126 Christoph Hellwig 2014-10-11  1139  =

906d15fbd23c126 Christoph Hellwig 2014-10-11  1140  	result =3D scsi_ioctl_=
block_when_processing_errors(sdp->device,
906d15fbd23c126 Christoph Hellwig 2014-10-11  1141  			cmd_in, filp->f_flag=
s & O_NDELAY);
906d15fbd23c126 Christoph Hellwig 2014-10-11  1142  	if (result)
906d15fbd23c126 Christoph Hellwig 2014-10-11  1143  		return result;
d320a9551e394cb Arnd Bergmann     2019-03-15  1144  =

d320a9551e394cb Arnd Bergmann     2019-03-15 @1145  	return -ENOIOCTLCMD;
^1da177e4c3f415 Linus Torvalds    2005-04-16  1146  }
^1da177e4c3f415 Linus Torvalds    2005-04-16  1147  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org

--===============0036147489154166068==
Content-Type: application/gzip
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="config.gz"

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
--===============0036147489154166068==--

