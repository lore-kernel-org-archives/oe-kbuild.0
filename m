Content-Type: multipart/mixed; boundary="===============0627143151390182032=="
MIME-Version: 1.0
From: Dan Carpenter <dan.carpenter@oracle.com>
Subject: Re: [PATCH] vdpa: Consider device id larger than 31
Date: Mon, 29 Nov 2021 09:58:46 +0300
Message-ID: <20211129065846.GN18178@kadam>
In-Reply-To: <20211128071435.GB99190@mtl-vdi-166.wap.labs.mlnx>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============0627143151390182032==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Sun, Nov 28, 2021 at 09:14:35AM +0200, Eli Cohen wrote:
> On Fri, Nov 26, 2021 at 10:48:12AM +0800, Jason Wang wrote:
> > On Fri, Nov 26, 2021 at 2:09 AM Parav Pandit <parav@nvidia.com> wrote:
> > >
> > > virtio device id value can be more than 31. Hence, use BIT_ULL in
> > > assignment.
> > >
> > > Fixes: 33b347503f01 ("vdpa: Define vdpa mgmt device, ops and a netlin=
k interface")
> > > Reported-by: kernel test robot <lkp@intel.com>
> > > Reported-by: Dan Carpenter <dan.carpenter@oracle.com>
> > > Signed-off-by: Parav Pandit <parav@nvidia.com>
> > =

> > Acked-by: Jason Wang <jasowang@redhat.com>
> > =

> > > ---
> > >  drivers/vdpa/vdpa.c | 2 +-
> > >  1 file changed, 1 insertion(+), 1 deletion(-)
> > >
> > > diff --git a/drivers/vdpa/vdpa.c b/drivers/vdpa/vdpa.c
> > > index 7332a74a4b00..e91c71aeeddf 100644
> > > --- a/drivers/vdpa/vdpa.c
> > > +++ b/drivers/vdpa/vdpa.c
> > > @@ -404,7 +404,7 @@ static int vdpa_mgmtdev_fill(const struct vdpa_mg=
mt_dev *mdev, struct sk_buff *m
> > >                 goto msg_err;
> > >
> > >         while (mdev->id_table[i].device) {
> > > -               supported_classes |=3D BIT(mdev->id_table[i].device);
> > > +               supported_classes |=3D BIT_ULL(mdev->id_table[i].devi=
ce);
> > >                 i++;
> > >         }
> > >
> =

> type of mdev->id_table[i].device is __u32 so in theory you're limited
> to device ID's up to 63.

A u32 can fit numbers up to 4 million?  These .device numbers are
normally hardcoded defines listed in usr/include/linux/virtio_ids.h

But sometimes they're not like in vp_modern_probe() which does:

	mdev->id.device =3D pci_dev->device - 0x1040;

I don't know if an assert is really worth it, considering how almost all
of them are hardcoded.  Also if we do want an assert maybe there is a
better place to put it?

regards,
dan carpenter
--===============0627143151390182032==--

