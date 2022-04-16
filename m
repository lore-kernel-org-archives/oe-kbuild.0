Content-Type: multipart/mixed; boundary="===============4110463725745484317=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [leon-rdma:testing/rdma-rc 3/5] drivers/infiniband/core/cma.c:4434 rdma_accept() error: we previously assumed 'conn_param' could be null (see line 4426)
Date: Sun, 17 Apr 2022 05:45:02 +0800
Message-ID: <202204170528.vQtGdF70-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============4110463725745484317==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: linux-kernel(a)vger.kernel.org
TO: Mark Zhang <markzhang@nvidia.com>
CC: Leon Romanovsky <leon@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/leon/linux-rdma.git=
 testing/rdma-rc
head:   c13a08911e7631d9ec7aea7ee7158a67466f9cd5
commit: e1390ac2297d8a0dafa312d2720059d6270e9356 [3/5] RDMA/cma: Limit join=
 multicast to UD QP type only
:::::: branch date: 2 days ago
:::::: commit date: 4 days ago
config: arm64-randconfig-m031-20220415 (https://download.01.org/0day-ci/arc=
hive/20220417/202204170528.vQtGdF70-lkp(a)intel.com/config)
compiler: aarch64-linux-gcc (GCC) 11.2.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

smatch warnings:
drivers/infiniband/core/cma.c:4434 rdma_accept() error: we previously assum=
ed 'conn_param' could be null (see line 4426)

vim +/conn_param +4434 drivers/infiniband/core/cma.c

628e5f6d39d5a6b Sean Hefty      2006-11-30  4396  =

b09c4d70122091c Leon Romanovsky 2020-09-22  4397  /**
b09c4d70122091c Leon Romanovsky 2020-09-22  4398   * rdma_accept - Called t=
o accept a connection request or response.
b09c4d70122091c Leon Romanovsky 2020-09-22  4399   * @id: Connection identi=
fier associated with the request.
b09c4d70122091c Leon Romanovsky 2020-09-22  4400   * @conn_param: Informati=
on needed to establish the connection.  This must be
b09c4d70122091c Leon Romanovsky 2020-09-22  4401   *   provided if acceptin=
g a connection request.  If accepting a connection
b09c4d70122091c Leon Romanovsky 2020-09-22  4402   *   response, this param=
eter must be NULL.
b09c4d70122091c Leon Romanovsky 2020-09-22  4403   *
b09c4d70122091c Leon Romanovsky 2020-09-22  4404   * Typically, this routin=
e is only called by the listener to accept a connection
b09c4d70122091c Leon Romanovsky 2020-09-22  4405   * request.  It must also=
 be called on the active side of a connection if the
b09c4d70122091c Leon Romanovsky 2020-09-22  4406   * user is performing the=
ir own QP transitions.
b09c4d70122091c Leon Romanovsky 2020-09-22  4407   *
b09c4d70122091c Leon Romanovsky 2020-09-22  4408   * In the case of error, =
a reject message is sent to the remote side and the
b09c4d70122091c Leon Romanovsky 2020-09-22  4409   * state of the qp associ=
ated with the id is modified to error, such that any
b09c4d70122091c Leon Romanovsky 2020-09-22  4410   * previously posted rece=
ive buffers would be flushed.
b09c4d70122091c Leon Romanovsky 2020-09-22  4411   *
b09c4d70122091c Leon Romanovsky 2020-09-22  4412   * This function is for u=
se by kernel ULPs and must be called from under the
b09c4d70122091c Leon Romanovsky 2020-09-22  4413   * handler callback.
b09c4d70122091c Leon Romanovsky 2020-09-22  4414   */
b09c4d70122091c Leon Romanovsky 2020-09-22  4415  int rdma_accept(struct rd=
ma_cm_id *id, struct rdma_conn_param *conn_param)
e51060f08a61965 Sean Hefty      2006-06-17  4416  {
d114c6feedfe060 Jason Gunthorpe 2020-08-18  4417  	struct rdma_id_private *=
id_priv =3D
d114c6feedfe060 Jason Gunthorpe 2020-08-18  4418  		container_of(id, struct=
 rdma_id_private, id);
e51060f08a61965 Sean Hefty      2006-06-17  4419  	int ret;
e51060f08a61965 Sean Hefty      2006-06-17  4420  =

d114c6feedfe060 Jason Gunthorpe 2020-08-18  4421  	lockdep_assert_held(&id_=
priv->handler_mutex);
83e9502d8db1428 Nir Muchtar     2011-01-13  4422  =

d114c6feedfe060 Jason Gunthorpe 2020-08-18  4423  	if (READ_ONCE(id_priv->s=
tate) !=3D RDMA_CM_CONNECT)
e51060f08a61965 Sean Hefty      2006-06-17  4424  		return -EINVAL;
e51060f08a61965 Sean Hefty      2006-06-17  4425  =

e51060f08a61965 Sean Hefty      2006-06-17 @4426  	if (!id->qp && conn_para=
m) {
e51060f08a61965 Sean Hefty      2006-06-17  4427  		id_priv->qp_num =3D con=
n_param->qp_num;
e51060f08a61965 Sean Hefty      2006-06-17  4428  		id_priv->srq =3D conn_p=
aram->srq;
e51060f08a61965 Sean Hefty      2006-06-17  4429  	}
e51060f08a61965 Sean Hefty      2006-06-17  4430  =

72219cea8e246a5 Michael Wang    2015-05-05  4431  	if (rdma_cap_ib_cm(id->d=
evice, id->port_num)) {
f45ee80eb0dda1f Hefty, Sean     2011-10-06  4432  		if (id->qp_type =3D=3D =
IB_QPT_UD) {
628e5f6d39d5a6b Sean Hefty      2006-11-30  4433  			ret =3D cma_send_sidr_=
rep(id_priv, IB_SIDR_SUCCESS,
5c438135adf90b3 Sean Hefty      2013-05-29 @4434  						conn_param->qkey,
628e5f6d39d5a6b Sean Hefty      2006-11-30  4435  						conn_param->private=
_data,
628e5f6d39d5a6b Sean Hefty      2006-11-30  4436  						conn_param->private=
_data_len);
f45ee80eb0dda1f Hefty, Sean     2011-10-06  4437  		} else {
f45ee80eb0dda1f Hefty, Sean     2011-10-06  4438  			if (conn_param)
e51060f08a61965 Sean Hefty      2006-06-17  4439  				ret =3D cma_accept_ib=
(id_priv, conn_param);
e51060f08a61965 Sean Hefty      2006-06-17  4440  			else
e51060f08a61965 Sean Hefty      2006-06-17  4441  				ret =3D cma_rep_recv(=
id_priv);
f45ee80eb0dda1f Hefty, Sean     2011-10-06  4442  		}
b6eb7011f561a29 Wenpeng Liang   2021-04-07  4443  	} else if (rdma_cap_iw_c=
m(id->device, id->port_num)) {
07ebafbaaa72aa6 Tom Tucker      2006-08-03  4444  		ret =3D cma_accept_iw(i=
d_priv, conn_param);
b6eb7011f561a29 Wenpeng Liang   2021-04-07  4445  	} else {
e51060f08a61965 Sean Hefty      2006-06-17  4446  		ret =3D -ENOSYS;
b6eb7011f561a29 Wenpeng Liang   2021-04-07  4447  	}
e51060f08a61965 Sean Hefty      2006-06-17  4448  	if (ret)
e51060f08a61965 Sean Hefty      2006-06-17  4449  		goto reject;
e51060f08a61965 Sean Hefty      2006-06-17  4450  =

e51060f08a61965 Sean Hefty      2006-06-17  4451  	return 0;
e51060f08a61965 Sean Hefty      2006-06-17  4452  reject:
c5483388bb4d771 Sean Hefty      2007-09-24  4453  	cma_modify_qp_err(id_pri=
v);
8094ba0ace7f6cd Leon Romanovsky 2020-05-26  4454  	rdma_reject(id, NULL, 0,=
 IB_CM_REJ_CONSUMER_DEFINED);
e51060f08a61965 Sean Hefty      2006-06-17  4455  	return ret;
e51060f08a61965 Sean Hefty      2006-06-17  4456  }
b09c4d70122091c Leon Romanovsky 2020-09-22  4457  EXPORT_SYMBOL(rdma_accept=
);
e51060f08a61965 Sean Hefty      2006-06-17  4458  =


:::::: The code at line 4434 was first introduced by commit
:::::: 5c438135adf90b33cb00e5351becf1e557bbdd9d RDMA/cma: Set qkey for AF_IB

:::::: TO: Sean Hefty <sean.hefty@intel.com>
:::::: CC: Roland Dreier <roland@purestorage.com>

-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============4110463725745484317==--

