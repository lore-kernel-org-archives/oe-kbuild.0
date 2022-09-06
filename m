Content-Type: multipart/mixed; boundary="===============1691621612017320661=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: Re: [PATCH] virtiofs: Drop unnecessary initialization in send_forget_request and virtio_fs_get_tree
Date: Tue, 06 Sep 2022 23:56:01 +0800
Message-ID: <202209062303.NIS3Cdh3-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============1691621612017320661==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

BCC: lkp(a)intel.com
CC: kbuild-all(a)lists.01.org
In-Reply-To: <20220906053848.2503-1-wangdeming@inspur.com>
References: <20220906053848.2503-1-wangdeming@inspur.com>
TO: Deming Wang <wangdeming@inspur.com>
TO: vgoyal(a)redhat.com
TO: stefanha(a)redhat.com
TO: miklos(a)szeredi.hu
CC: virtualization(a)lists.linux-foundation.org
CC: linux-fsdevel(a)vger.kernel.org
CC: linux-kernel(a)vger.kernel.org
CC: Deming Wang <wangdeming@inspur.com>

Hi Deming,

Thank you for the patch! Perhaps something to improve:

[auto build test WARNING on v6.0-rc4]
[also build test WARNING on linus/master next-20220906]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Deming-Wang/virtiofs=
-Drop-unnecessary-initialization-in-send_forget_request-and-virtio_fs_get_t=
ree/20220906-135058
base:    7e18e42e4b280c85b76967a9106a13ca61c16179
:::::: branch date: 10 hours ago
:::::: commit date: 10 hours ago
config: x86_64-randconfig-m001 (https://download.01.org/0day-ci/archive/202=
20906/202209062303.NIS3Cdh3-lkp(a)intel.com/config)
compiler: gcc-11 (Debian 11.3.0-5) 11.3.0

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

smatch warnings:
fs/fuse/virtio_fs.c:465 send_forget_request() error: uninitialized symbol '=
ret'.
fs/fuse/virtio_fs.c:1477 virtio_fs_get_tree() error: uninitialized symbol '=
fc'.
fs/fuse/virtio_fs.c:1481 virtio_fs_get_tree() error: uninitialized symbol '=
err'.

vim +/ret +465 fs/fuse/virtio_fs.c

a62a8ef9d97da2 Stefan Hajnoczi 2018-06-12  406  =

58ada94f95f71d Vivek Goyal     2019-10-30  407  /*
58ada94f95f71d Vivek Goyal     2019-10-30  408   * Returns 1 if queue is fu=
ll and sender should wait a bit before sending
58ada94f95f71d Vivek Goyal     2019-10-30  409   * next request, 0 otherwis=
e.
58ada94f95f71d Vivek Goyal     2019-10-30  410   */
58ada94f95f71d Vivek Goyal     2019-10-30  411  static int send_forget_requ=
est(struct virtio_fs_vq *fsvq,
58ada94f95f71d Vivek Goyal     2019-10-30  412  			       struct virtio_fs_=
forget *forget,
58ada94f95f71d Vivek Goyal     2019-10-30  413  			       bool in_flight)
a62a8ef9d97da2 Stefan Hajnoczi 2018-06-12  414  {
a62a8ef9d97da2 Stefan Hajnoczi 2018-06-12  415  	struct scatterlist sg;
58ada94f95f71d Vivek Goyal     2019-10-30  416  	struct virtqueue *vq;
a61f879fdb5649 Deming Wang     2022-09-06  417  	int ret;
a62a8ef9d97da2 Stefan Hajnoczi 2018-06-12  418  	bool notify;
1efcf39eb62757 Vivek Goyal     2019-10-30  419  	struct virtio_fs_forget_re=
q *req =3D &forget->req;
a62a8ef9d97da2 Stefan Hajnoczi 2018-06-12  420  =

a62a8ef9d97da2 Stefan Hajnoczi 2018-06-12  421  	spin_lock(&fsvq->lock);
a62a8ef9d97da2 Stefan Hajnoczi 2018-06-12  422  	if (!fsvq->connected) {
58ada94f95f71d Vivek Goyal     2019-10-30  423  		if (in_flight)
c17ea009610366 Vivek Goyal     2019-10-15  424  			dec_in_flight_req(fsvq);
a62a8ef9d97da2 Stefan Hajnoczi 2018-06-12  425  		kfree(forget);
58ada94f95f71d Vivek Goyal     2019-10-30  426  		goto out;
a62a8ef9d97da2 Stefan Hajnoczi 2018-06-12  427  	}
a62a8ef9d97da2 Stefan Hajnoczi 2018-06-12  428  =

1efcf39eb62757 Vivek Goyal     2019-10-30  429  	sg_init_one(&sg, req, size=
of(*req));
58ada94f95f71d Vivek Goyal     2019-10-30  430  	vq =3D fsvq->vq;
a62a8ef9d97da2 Stefan Hajnoczi 2018-06-12  431  	dev_dbg(&vq->vdev->dev, "%=
s\n", __func__);
58ada94f95f71d Vivek Goyal     2019-10-30  432  =

58ada94f95f71d Vivek Goyal     2019-10-30  433  	ret =3D virtqueue_add_outb=
uf(vq, &sg, 1, forget, GFP_ATOMIC);
a62a8ef9d97da2 Stefan Hajnoczi 2018-06-12  434  	if (ret < 0) {
a62a8ef9d97da2 Stefan Hajnoczi 2018-06-12  435  		if (ret =3D=3D -ENOMEM ||=
 ret =3D=3D -ENOSPC) {
a62a8ef9d97da2 Stefan Hajnoczi 2018-06-12  436  			pr_debug("virtio-fs: Cou=
ld not queue FORGET: err=3D%d. Will try later\n",
a62a8ef9d97da2 Stefan Hajnoczi 2018-06-12  437  				 ret);
58ada94f95f71d Vivek Goyal     2019-10-30  438  			list_add_tail(&forget->l=
ist, &fsvq->queued_reqs);
a62a8ef9d97da2 Stefan Hajnoczi 2018-06-12  439  			schedule_delayed_work(&f=
svq->dispatch_work,
a62a8ef9d97da2 Stefan Hajnoczi 2018-06-12  440  					      msecs_to_jiffies=
(1));
58ada94f95f71d Vivek Goyal     2019-10-30  441  			if (!in_flight)
58ada94f95f71d Vivek Goyal     2019-10-30  442  				inc_in_flight_req(fsvq);
58ada94f95f71d Vivek Goyal     2019-10-30  443  			/* Queue is full */
58ada94f95f71d Vivek Goyal     2019-10-30  444  			ret =3D 1;
a62a8ef9d97da2 Stefan Hajnoczi 2018-06-12  445  		} else {
a62a8ef9d97da2 Stefan Hajnoczi 2018-06-12  446  			pr_debug("virtio-fs: Cou=
ld not queue FORGET: err=3D%d. Dropping it.\n",
a62a8ef9d97da2 Stefan Hajnoczi 2018-06-12  447  				 ret);
a62a8ef9d97da2 Stefan Hajnoczi 2018-06-12  448  			kfree(forget);
58ada94f95f71d Vivek Goyal     2019-10-30  449  			if (in_flight)
58ada94f95f71d Vivek Goyal     2019-10-30  450  				dec_in_flight_req(fsvq);
a62a8ef9d97da2 Stefan Hajnoczi 2018-06-12  451  		}
58ada94f95f71d Vivek Goyal     2019-10-30  452  		goto out;
a62a8ef9d97da2 Stefan Hajnoczi 2018-06-12  453  	}
a62a8ef9d97da2 Stefan Hajnoczi 2018-06-12  454  =

58ada94f95f71d Vivek Goyal     2019-10-30  455  	if (!in_flight)
58ada94f95f71d Vivek Goyal     2019-10-30  456  		inc_in_flight_req(fsvq);
a62a8ef9d97da2 Stefan Hajnoczi 2018-06-12  457  	notify =3D virtqueue_kick_=
prepare(vq);
a62a8ef9d97da2 Stefan Hajnoczi 2018-06-12  458  	spin_unlock(&fsvq->lock);
a62a8ef9d97da2 Stefan Hajnoczi 2018-06-12  459  =

a62a8ef9d97da2 Stefan Hajnoczi 2018-06-12  460  	if (notify)
a62a8ef9d97da2 Stefan Hajnoczi 2018-06-12  461  		virtqueue_notify(vq);
58ada94f95f71d Vivek Goyal     2019-10-30  462  	return ret;
58ada94f95f71d Vivek Goyal     2019-10-30  463  out:
58ada94f95f71d Vivek Goyal     2019-10-30  464  	spin_unlock(&fsvq->lock);
58ada94f95f71d Vivek Goyal     2019-10-30 @465  	return ret;
58ada94f95f71d Vivek Goyal     2019-10-30  466  }
58ada94f95f71d Vivek Goyal     2019-10-30  467  =


-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============1691621612017320661==--

