Content-Type: multipart/mixed; boundary="===============8197349314786213564=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: Re: [PATCH] vhost/vsock: don't check owner in vhost_vsock_stop() while releasing
Date: Tue, 22 Feb 2022 07:51:42 +0800
Message-ID: <202202220707.AM3rKUcP-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============8197349314786213564==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
In-Reply-To: <20220221114916.107045-1-sgarzare@redhat.com>
References: <20220221114916.107045-1-sgarzare@redhat.com>
TO: Stefano Garzarella <sgarzare@redhat.com>
TO: "Michael S. Tsirkin" <mst@redhat.com>
CC: linux-kernel(a)vger.kernel.org
CC: Mike Christie <michael.christie@oracle.com>
CC: Stefano Garzarella <sgarzare@redhat.com>
CC: Jason Wang <jasowang@redhat.com>
CC: netdev(a)vger.kernel.org
CC: Asias He <asias@redhat.com>
CC: virtualization(a)lists.linux-foundation.org
CC: Stefan Hajnoczi <stefanha@redhat.com>
CC: kvm(a)vger.kernel.org

Hi Stefano,

I love your patch! Perhaps something to improve:

[auto build test WARNING on mst-vhost/linux-next]
[also build test WARNING on linux/master net/master horms-ipvs/master net-n=
ext/master linus/master v5.17-rc5 next-20220217]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/0day-ci/linux/commits/Stefano-Garzarella/vhost-v=
sock-don-t-check-owner-in-vhost_vsock_stop-while-releasing/20220221-195038
base:   https://git.kernel.org/pub/scm/linux/kernel/git/mst/vhost.git linux=
-next
:::::: branch date: 12 hours ago
:::::: commit date: 12 hours ago
config: x86_64-randconfig-m031-20220221 (https://download.01.org/0day-ci/ar=
chive/20220222/202202220707.AM3rKUcP-lkp(a)intel.com/config)
compiler: gcc-9 (Debian 9.3.0-22) 9.3.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

smatch warnings:
drivers/vhost/vsock.c:655 vhost_vsock_stop() error: uninitialized symbol 'r=
et'.

vim +/ret +655 drivers/vhost/vsock.c

433fc58e6bf2c8 Asias He           2016-07-28  631  =

3ace84c91bfcde Stefano Garzarella 2022-02-21  632  static int vhost_vsock_s=
top(struct vhost_vsock *vsock, bool check_owner)
433fc58e6bf2c8 Asias He           2016-07-28  633  {
433fc58e6bf2c8 Asias He           2016-07-28  634  	size_t i;
433fc58e6bf2c8 Asias He           2016-07-28  635  	int ret;
433fc58e6bf2c8 Asias He           2016-07-28  636  =

433fc58e6bf2c8 Asias He           2016-07-28  637  	mutex_lock(&vsock->dev.=
mutex);
433fc58e6bf2c8 Asias He           2016-07-28  638  =

3ace84c91bfcde Stefano Garzarella 2022-02-21  639  	if (check_owner) {
433fc58e6bf2c8 Asias He           2016-07-28  640  		ret =3D vhost_dev_chec=
k_owner(&vsock->dev);
433fc58e6bf2c8 Asias He           2016-07-28  641  		if (ret)
433fc58e6bf2c8 Asias He           2016-07-28  642  			goto err;
3ace84c91bfcde Stefano Garzarella 2022-02-21  643  	}
433fc58e6bf2c8 Asias He           2016-07-28  644  =

433fc58e6bf2c8 Asias He           2016-07-28  645  	for (i =3D 0; i < ARRAY=
_SIZE(vsock->vqs); i++) {
433fc58e6bf2c8 Asias He           2016-07-28  646  		struct vhost_virtqueue=
 *vq =3D &vsock->vqs[i];
433fc58e6bf2c8 Asias He           2016-07-28  647  =

433fc58e6bf2c8 Asias He           2016-07-28  648  		mutex_lock(&vq->mutex);
247643f85782fc Eugenio P=C3=A9rez      2020-03-31  649  		vhost_vq_set_back=
end(vq, NULL);
433fc58e6bf2c8 Asias He           2016-07-28  650  		mutex_unlock(&vq->mute=
x);
433fc58e6bf2c8 Asias He           2016-07-28  651  	}
433fc58e6bf2c8 Asias He           2016-07-28  652  =

433fc58e6bf2c8 Asias He           2016-07-28  653  err:
433fc58e6bf2c8 Asias He           2016-07-28  654  	mutex_unlock(&vsock->de=
v.mutex);
433fc58e6bf2c8 Asias He           2016-07-28 @655  	return ret;
433fc58e6bf2c8 Asias He           2016-07-28  656  }
433fc58e6bf2c8 Asias He           2016-07-28  657  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============8197349314786213564==--

