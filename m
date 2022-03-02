Content-Type: multipart/mixed; boundary="===============6649057798534778645=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [ammarfaizi2-block:dhowells/linux-fs/fscache-next 36/39] fs/netfs/io.c:655 netfs_begin_read() error: uninitialized symbol 'ret'.
Date: Thu, 03 Mar 2022 05:08:16 +0800
Message-ID: <202203030504.jcsYdjgY-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============6649057798534778645==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: "GNU/Weeb Mailing List" <gwml@vger.gnuweeb.org>
CC: linux-kernel(a)vger.kernel.org
TO: David Howells <dhowells@redhat.com>

tree:   https://github.com/ammarfaizi2/linux-block dhowells/linux-fs/fscach=
e-next
head:   78e12b114b9c804d4b1eef16b6df1112cde6a960
commit: ad9e5adb388f358027a51032b3944913d98f7866 [36/39] netfs: Rename rena=
me read_helper.c to io.c
:::::: branch date: 9 hours ago
:::::: commit date: 9 hours ago
config: arm-randconfig-m031-20220302 (https://download.01.org/0day-ci/archi=
ve/20220303/202203030504.jcsYdjgY-lkp(a)intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 11.2.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

smatch warnings:
fs/netfs/io.c:655 netfs_begin_read() error: uninitialized symbol 'ret'.

vim +/ret +655 fs/netfs/io.c

3d3c95046742e4 fs/netfs/read_helper.c David Howells 2020-05-13  595  =

c19a5d31b470e0 fs/netfs/read_helper.c David Howells 2022-03-02  596  /*
c19a5d31b470e0 fs/netfs/read_helper.c David Howells 2022-03-02  597   * Beg=
in the process of reading in a chunk of data, where that data may be
c19a5d31b470e0 fs/netfs/read_helper.c David Howells 2022-03-02  598   * sti=
tched together from multiple sources, including multiple servers and the
c19a5d31b470e0 fs/netfs/read_helper.c David Howells 2022-03-02  599   * loc=
al cache.
c19a5d31b470e0 fs/netfs/read_helper.c David Howells 2022-03-02  600   */
c19a5d31b470e0 fs/netfs/read_helper.c David Howells 2022-03-02  601  int ne=
tfs_begin_read(struct netfs_io_request *rreq, bool sync)
c19a5d31b470e0 fs/netfs/read_helper.c David Howells 2022-03-02  602  {
c19a5d31b470e0 fs/netfs/read_helper.c David Howells 2022-03-02  603  	unsig=
ned int debug_index =3D 0;
c19a5d31b470e0 fs/netfs/read_helper.c David Howells 2022-03-02  604  	int r=
et;
c19a5d31b470e0 fs/netfs/read_helper.c David Howells 2022-03-02  605  =

c19a5d31b470e0 fs/netfs/read_helper.c David Howells 2022-03-02  606  	_ente=
r("R=3D%x %llx-%llx",
c19a5d31b470e0 fs/netfs/read_helper.c David Howells 2022-03-02  607  	     =
  rreq->debug_id, rreq->start, rreq->start + rreq->len - 1);
c19a5d31b470e0 fs/netfs/read_helper.c David Howells 2022-03-02  608  =

c19a5d31b470e0 fs/netfs/read_helper.c David Howells 2022-03-02  609  	if (r=
req->len =3D=3D 0) {
c19a5d31b470e0 fs/netfs/read_helper.c David Howells 2022-03-02  610  		pr_e=
rr("Zero-sized read [R=3D%x]\n", rreq->debug_id);
c19a5d31b470e0 fs/netfs/read_helper.c David Howells 2022-03-02  611  		netf=
s_put_request(rreq, false, netfs_rreq_trace_put_zero_len);
c19a5d31b470e0 fs/netfs/read_helper.c David Howells 2022-03-02  612  		retu=
rn -EIO;
c19a5d31b470e0 fs/netfs/read_helper.c David Howells 2022-03-02  613  	}
c19a5d31b470e0 fs/netfs/read_helper.c David Howells 2022-03-02  614  =

c19a5d31b470e0 fs/netfs/read_helper.c David Howells 2022-03-02  615  	rreq-=
>work.func =3D netfs_rreq_work;
c19a5d31b470e0 fs/netfs/read_helper.c David Howells 2022-03-02  616  =

c19a5d31b470e0 fs/netfs/read_helper.c David Howells 2022-03-02  617  	if (s=
ync)
c19a5d31b470e0 fs/netfs/read_helper.c David Howells 2022-03-02  618  		netf=
s_get_request(rreq, netfs_rreq_trace_get_hold);
c19a5d31b470e0 fs/netfs/read_helper.c David Howells 2022-03-02  619  =

c19a5d31b470e0 fs/netfs/read_helper.c David Howells 2022-03-02  620  	/* Ch=
op the read into slices according to what the cache and the netfs
c19a5d31b470e0 fs/netfs/read_helper.c David Howells 2022-03-02  621  	 * wa=
nt and submit each one.
c19a5d31b470e0 fs/netfs/read_helper.c David Howells 2022-03-02  622  	 */
c19a5d31b470e0 fs/netfs/read_helper.c David Howells 2022-03-02  623  	atomi=
c_set(&rreq->nr_outstanding, 1);
c19a5d31b470e0 fs/netfs/read_helper.c David Howells 2022-03-02  624  	do {
c19a5d31b470e0 fs/netfs/read_helper.c David Howells 2022-03-02  625  		if (=
!netfs_rreq_submit_slice(rreq, &debug_index))
c19a5d31b470e0 fs/netfs/read_helper.c David Howells 2022-03-02  626  			bre=
ak;
c19a5d31b470e0 fs/netfs/read_helper.c David Howells 2022-03-02  627  =

c19a5d31b470e0 fs/netfs/read_helper.c David Howells 2022-03-02  628  	} whi=
le (rreq->submitted < rreq->len);
c19a5d31b470e0 fs/netfs/read_helper.c David Howells 2022-03-02  629  =

c19a5d31b470e0 fs/netfs/read_helper.c David Howells 2022-03-02  630  	if (s=
ync) {
c19a5d31b470e0 fs/netfs/read_helper.c David Howells 2022-03-02  631  		/* K=
eep nr_outstanding incremented so that the ref always belongs to
c19a5d31b470e0 fs/netfs/read_helper.c David Howells 2022-03-02  632  		 * u=
s, and the service code isn't punted off to a random thread pool to
c19a5d31b470e0 fs/netfs/read_helper.c David Howells 2022-03-02  633  		 * p=
rocess.
c19a5d31b470e0 fs/netfs/read_helper.c David Howells 2022-03-02  634  		 */
c19a5d31b470e0 fs/netfs/read_helper.c David Howells 2022-03-02  635  		for =
(;;) {
c19a5d31b470e0 fs/netfs/read_helper.c David Howells 2022-03-02  636  			wai=
t_var_event(&rreq->nr_outstanding,
c19a5d31b470e0 fs/netfs/read_helper.c David Howells 2022-03-02  637  				  =
     atomic_read(&rreq->nr_outstanding) =3D=3D 1);
c19a5d31b470e0 fs/netfs/read_helper.c David Howells 2022-03-02  638  			net=
fs_rreq_assess(rreq, false);
c19a5d31b470e0 fs/netfs/read_helper.c David Howells 2022-03-02  639  			if =
(!test_bit(NETFS_RREQ_IN_PROGRESS, &rreq->flags))
c19a5d31b470e0 fs/netfs/read_helper.c David Howells 2022-03-02  640  				br=
eak;
c19a5d31b470e0 fs/netfs/read_helper.c David Howells 2022-03-02  641  			con=
d_resched();
c19a5d31b470e0 fs/netfs/read_helper.c David Howells 2022-03-02  642  		}
c19a5d31b470e0 fs/netfs/read_helper.c David Howells 2022-03-02  643  =

c19a5d31b470e0 fs/netfs/read_helper.c David Howells 2022-03-02  644  		ret =
=3D rreq->error;
c19a5d31b470e0 fs/netfs/read_helper.c David Howells 2022-03-02  645  		if (=
ret =3D=3D 0 && rreq->submitted < rreq->len) {
c19a5d31b470e0 fs/netfs/read_helper.c David Howells 2022-03-02  646  			tra=
ce_netfs_failure(rreq, NULL, ret, netfs_fail_short_read);
c19a5d31b470e0 fs/netfs/read_helper.c David Howells 2022-03-02  647  			ret=
 =3D -EIO;
c19a5d31b470e0 fs/netfs/read_helper.c David Howells 2022-03-02  648  		}
c19a5d31b470e0 fs/netfs/read_helper.c David Howells 2022-03-02  649  		netf=
s_put_request(rreq, false, netfs_rreq_trace_put_hold);
c19a5d31b470e0 fs/netfs/read_helper.c David Howells 2022-03-02  650  	} els=
e {
c19a5d31b470e0 fs/netfs/read_helper.c David Howells 2022-03-02  651  		/* I=
f we decrement nr_outstanding to 0, the ref belongs to us. */
c19a5d31b470e0 fs/netfs/read_helper.c David Howells 2022-03-02  652  		if (=
atomic_dec_and_test(&rreq->nr_outstanding))
c19a5d31b470e0 fs/netfs/read_helper.c David Howells 2022-03-02  653  			net=
fs_rreq_assess(rreq, false);
c19a5d31b470e0 fs/netfs/read_helper.c David Howells 2022-03-02  654  	}
c19a5d31b470e0 fs/netfs/read_helper.c David Howells 2022-03-02 @655  	retur=
n ret;

:::::: The code at line 655 was first introduced by commit
:::::: c19a5d31b470e0a7dea07a71bb7b98a916b449e9 netfs: Add a function to co=
nsolidate beginning a read

:::::: TO: David Howells <dhowells@redhat.com>
:::::: CC: David Howells <dhowells@redhat.com>

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============6649057798534778645==--

