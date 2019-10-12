Content-Type: multipart/mixed; boundary="===============7358302457017887236=="
MIME-Version: 1.0
From: Dan Carpenter <dan.carpenter@oracle.com>
Subject: Re: [PATCH v4] drm/ioctl: Add a ioctl to label GEM objects
Date: Sat, 12 Oct 2019 16:35:57 +0300
Message-ID: <20191012133557.GV13286@kadam>
In-Reply-To: <20191011143009.17503-1-rohan.garg@collabora.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============7358302457017887236==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi Rohan,

Thank you for the patch! Perhaps something to improve:

[auto build test WARNING on linus/master]
[cannot apply to v5.4-rc2 next-20191011]
[if your patch is applied to the wrong git tree, please drop us a note to h=
elp
improve the system. BTW, we also suggest to use '--base' option to specify =
the
base tree in git format-patch, please see https://stackoverflow.com/a/37406=
982]

url:    https://github.com/0day-ci/linux/commits/Rohan-Garg/drm-ioctl-Add-a=
-ioctl-to-label-GEM-objects/20191012-062955

If you fix the issue, kindly add following tag
Reported-by: kbuild test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

smatch warnings:
drivers/gpu/drm/drm_gem.c:967 drm_dumb_set_label_ioctl() error: 'label' der=
eferencing possible ERR_PTR()

# https://github.com/0day-ci/linux/commit/0f0cd7ef9f3b1623ab982f12dc748998f=
31e10b4
git remote add linux-review https://github.com/0day-ci/linux
git remote update linux-review
git checkout 0f0cd7ef9f3b1623ab982f12dc748998f31e10b4
vim +/label +967 drivers/gpu/drm/drm_gem.c

673a394b1e3b69 Eric Anholt 2008-07-30  943  =

0f0cd7ef9f3b16 Rohan Garg  2019-10-11  944  int drm_dumb_set_label_ioctl(st=
ruct drm_device *dev,
0f0cd7ef9f3b16 Rohan Garg  2019-10-11  945  				void *data, struct drm_file=
 *file_priv)
0f0cd7ef9f3b16 Rohan Garg  2019-10-11  946  {
0f0cd7ef9f3b16 Rohan Garg  2019-10-11  947  	char *label;
0f0cd7ef9f3b16 Rohan Garg  2019-10-11  948  	struct drm_dumb_set_label_obje=
ct *args =3D data;
0f0cd7ef9f3b16 Rohan Garg  2019-10-11  949  	int ret =3D 0;
0f0cd7ef9f3b16 Rohan Garg  2019-10-11  950  =

0f0cd7ef9f3b16 Rohan Garg  2019-10-11  951  	if (!args->len || !args->name)
0f0cd7ef9f3b16 Rohan Garg  2019-10-11  952  		return -EINVAL;
0f0cd7ef9f3b16 Rohan Garg  2019-10-11  953  =

0f0cd7ef9f3b16 Rohan Garg  2019-10-11  954  	if (!dev->driver->label)
0f0cd7ef9f3b16 Rohan Garg  2019-10-11  955  		return -EOPNOTSUPP;
0f0cd7ef9f3b16 Rohan Garg  2019-10-11  956  =

0f0cd7ef9f3b16 Rohan Garg  2019-10-11  957  	label =3D strndup_user(u64_to_=
user_ptr(args->name), args->len);
0f0cd7ef9f3b16 Rohan Garg  2019-10-11  958  =

0f0cd7ef9f3b16 Rohan Garg  2019-10-11  959  	if (IS_ERR(label)) {
0f0cd7ef9f3b16 Rohan Garg  2019-10-11  960  		ret =3D PTR_ERR(label);
0f0cd7ef9f3b16 Rohan Garg  2019-10-11  961  		goto err;
                                                        ^^^^^^^^
Just return PTR_ERR(label);


0f0cd7ef9f3b16 Rohan Garg  2019-10-11  962  	}
0f0cd7ef9f3b16 Rohan Garg  2019-10-11  963  =

0f0cd7ef9f3b16 Rohan Garg  2019-10-11  964  	ret =3D dev->driver->label(dev=
, file_priv, args->handle, label);
0f0cd7ef9f3b16 Rohan Garg  2019-10-11  965  =

0f0cd7ef9f3b16 Rohan Garg  2019-10-11  966  err:
0f0cd7ef9f3b16 Rohan Garg  2019-10-11 @967  	kfree(label);
                                                ^^^^^^^^^^^^
This will Oops.

0f0cd7ef9f3b16 Rohan Garg  2019-10-11  968  	return ret;
0f0cd7ef9f3b16 Rohan Garg  2019-10-11  969  }
0f0cd7ef9f3b16 Rohan Garg  2019-10-11  970  =


---
0-DAY kernel test infrastructure                Open Source Technology Cent=
er
https://lists.01.org/pipermail/kbuild-all                   Intel Corporati=
on
--===============7358302457017887236==--

