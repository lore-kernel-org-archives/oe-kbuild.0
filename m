Content-Type: multipart/mixed; boundary="===============0950106752517711484=="
MIME-Version: 1.0
From: Dan Carpenter <dan.carpenter@oracle.com>
Subject: Re: [PATCH v3 3/5] staging: vchiq: Move vchiq char driver to its own file
Date: Mon, 05 Jul 2021 14:19:44 +0300
Message-ID: <20210705111944.GH26672@kadam>
In-Reply-To: <20210705105804.GA41070@ojas>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============0950106752517711484==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Mon, Jul 05, 2021 at 04:28:04PM +0530, Ojaswin Mujoo wrote:
> Hello Dan,
> =

> On Mon, Jul 05, 2021 at 12:56:09PM +0300, Dan Carpenter wrote:
> > Hi Ojaswin,
> > =

> > url:    https://github.com/0day-ci/linux/commits/Ojaswin-Mujoo/vchiq-Pa=
tch-to-separate-platform-and-cdev-code/20210705-000124 =

> > base:   https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/staging.=
git  77ad1f0e99bd00af024e650b862cfda3137af660
> > config: i386-randconfig-m021-20210705 (attached as .config)
> > compiler: gcc-9 (Debian 9.3.0-22) 9.3.0
> > =

> > If you fix the issue, kindly add following tag as appropriate
> > Reported-by: kernel test robot <lkp@intel.com>
> > Reported-by: Dan Carpenter <dan.carpenter@oracle.com>
> > =

> > smatch warnings:
> > drivers/staging/vc04_services/interface/vchiq_arm/vchiq_dev.c:1235 vchi=
q_release() warn: argument 3 to %lx specifier is cast from pointer
> > =

> > vim +1235 drivers/staging/vc04_services/interface/vchiq_arm/vchiq_dev.c
> > =

> > 62b5eb4fdf3f5f Ojaswin Mujoo 2021-07-04  1227  static int vchiq_release=
(struct inode *inode, struct file *file)
> > 62b5eb4fdf3f5f Ojaswin Mujoo 2021-07-04  1228  {
> > 62b5eb4fdf3f5f Ojaswin Mujoo 2021-07-04  1229  	struct vchiq_instance *=
instance =3D file->private_data;
> > 62b5eb4fdf3f5f Ojaswin Mujoo 2021-07-04  1230  	struct vchiq_state *sta=
te =3D vchiq_get_state();
> > 62b5eb4fdf3f5f Ojaswin Mujoo 2021-07-04  1231  	struct vchiq_service *s=
ervice;
> > 62b5eb4fdf3f5f Ojaswin Mujoo 2021-07-04  1232  	int ret =3D 0;
> > 62b5eb4fdf3f5f Ojaswin Mujoo 2021-07-04  1233  	int i;
> > 62b5eb4fdf3f5f Ojaswin Mujoo 2021-07-04  1234  =

> > 62b5eb4fdf3f5f Ojaswin Mujoo 2021-07-04 @1235  	vchiq_log_info(vchiq_ar=
m_log_level, "%s: instance=3D%lx", __func__,
> > 62b5eb4fdf3f5f Ojaswin Mujoo 2021-07-04  1236  		       (unsigned long)=
instance);
> > =

> > This should eventually be converted to %p so it doesn't defeat KASLR.
> > (Not that we really care on raspberry pi, I think?)
> Yes, that does seem right, however, this patchset only moves the code from
> vchiq_arm.c to vchiq_dev.c and I've not really touched any of the
> existing code itself (Except moving it to a new file which is why it show=
s up
> in the patch). =

> =

> Hence, I'm not sure if this fix is in scope of this patchset. (I also
> have a similar warning by kernel test robot here [1] which and I'm not
> sure if I need to act upon). Maybe we can look at this in a separate
> patch?

Yes.  Correct.  Don't mix this into the patch, do it "eventually".  Or
you don't have to do it at all since it wasn't something you introduced.
Someone will check the driver for Smatch warnings before it can be moved
out of staging.

(I just forwarded the kbuild bot messages for informational purposes
only).

regards,
dan carpenter

--===============0950106752517711484==--

