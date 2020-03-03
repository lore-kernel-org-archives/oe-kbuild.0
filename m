Content-Type: multipart/mixed; boundary="===============1125466321368778842=="
MIME-Version: 1.0
From: Dan Carpenter <dan.carpenter@oracle.com>
Subject: Re: [PATCH 03/51] drm: add managed resources tied to drm_device
Date: Tue, 03 Mar 2020 11:04:06 +0300
Message-ID: <20200303080406.GC24372@kadam>
In-Reply-To: <20200302222631.3861340-4-daniel.vetter@ffwll.ch>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============1125466321368778842==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi Daniel,

I love your patch! Perhaps something to improve:

url:    https://github.com/0day-ci/linux/commits/Daniel-Vetter/drm_device-m=
anaged-resources-v4/20200303-071023
base:   git://anongit.freedesktop.org/drm/drm-tip drm-tip

If you fix the issue, kindly add following tag
Reported-by: kbuild test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

smatch warnings:
drivers/gpu/drm/drm_drv.c:843 drm_dev_release() error: dereferencing freed =
memory 'dev'

# https://github.com/0day-ci/linux/commit/5aba700d4c32ae5722a9931c959b13a62=
17a86e2
git remote add linux-review https://github.com/0day-ci/linux
git remote update linux-review
git checkout 5aba700d4c32ae5722a9931c959b13a6217a86e2
vim +/dev +843 drivers/gpu/drm/drm_drv.c

099d1c290e2ebc drivers/gpu/drm/drm_stub.c David Herrmann 2014-01-29  826  s=
tatic void drm_dev_release(struct kref *ref)
0dc8fe5985e01f drivers/gpu/drm/drm_stub.c David Herrmann 2013-10-02  827  {
099d1c290e2ebc drivers/gpu/drm/drm_stub.c David Herrmann 2014-01-29  828  	=
struct drm_device *dev =3D container_of(ref, struct drm_device, ref);
8f6599da8e772f drivers/gpu/drm/drm_stub.c David Herrmann 2013-10-20  829  =

f30c92576af4bb drivers/gpu/drm/drm_drv.c  Chris Wilson   2017-02-02  830  	=
if (dev->driver->release) {
f30c92576af4bb drivers/gpu/drm/drm_drv.c  Chris Wilson   2017-02-02  831  	=
	dev->driver->release(dev);
f30c92576af4bb drivers/gpu/drm/drm_drv.c  Chris Wilson   2017-02-02  832  	=
} else {
f30c92576af4bb drivers/gpu/drm/drm_drv.c  Chris Wilson   2017-02-02  833  	=
	drm_dev_fini(dev);
5aba700d4c32ae drivers/gpu/drm/drm_drv.c  Daniel Vetter  2020-03-02  834  	}
5aba700d4c32ae drivers/gpu/drm/drm_drv.c  Daniel Vetter  2020-03-02  835  =

5aba700d4c32ae drivers/gpu/drm/drm_drv.c  Daniel Vetter  2020-03-02  836  	=
drm_managed_release(dev);
5aba700d4c32ae drivers/gpu/drm/drm_drv.c  Daniel Vetter  2020-03-02  837  =

5aba700d4c32ae drivers/gpu/drm/drm_drv.c  Daniel Vetter  2020-03-02  838  	=
if (!dev->driver->release && !dev->managed.final_kfree) {
5aba700d4c32ae drivers/gpu/drm/drm_drv.c  Daniel Vetter  2020-03-02  839  	=
	WARN_ON(!list_empty(&dev->managed.resources));
0dc8fe5985e01f drivers/gpu/drm/drm_stub.c David Herrmann 2013-10-02  840  	=
	kfree(dev);
                                                                           =
             ^^^^^^^^^^
Free

0dc8fe5985e01f drivers/gpu/drm/drm_stub.c David Herrmann 2013-10-02  841  	}
5aba700d4c32ae drivers/gpu/drm/drm_drv.c  Daniel Vetter  2020-03-02  842  =

5aba700d4c32ae drivers/gpu/drm/drm_drv.c  Daniel Vetter  2020-03-02 @843  	=
if (dev->managed.final_kfree)
                                                                           =
         ^^^^^
Dereference

5aba700d4c32ae drivers/gpu/drm/drm_drv.c  Daniel Vetter  2020-03-02  844  	=
	kfree(dev->managed.final_kfree);
f30c92576af4bb drivers/gpu/drm/drm_drv.c  Chris Wilson   2017-02-02  845  }

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============1125466321368778842==--

