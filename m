Content-Type: multipart/mixed; boundary="===============4551673142620746108=="
MIME-Version: 1.0
From: Dan Carpenter <dan.carpenter@oracle.com>
Subject: Re: [kees:kspp/uninit/macro 9/10] drivers/virtio/virtio_ring.c:1197 virtqueue_add_packed() error: uninitialized symbol 'prev'.
Date: Mon, 08 Jun 2020 14:38:03 +0300
Message-ID: <20200608113803.GX30374@kadam>
In-Reply-To: <202006051415.B06DA6D600@keescook>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============4551673142620746108==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Fri, Jun 05, 2020 at 02:20:12PM -0700, Kees Cook wrote:
> On Fri, Jun 05, 2020 at 01:38:20PM +0300, kernel test robot wrote:
> > smatch warnings:
> > drivers/virtio/virtio_ring.c:1197 virtqueue_add_packed() error: uniniti=
alized symbol 'prev'.
> > drivers/virtio/virtio_ring.c:1205 virtqueue_add_packed() error: uniniti=
alized symbol 'head_flags'.
> > drivers/virtio/virtio_ring.c:508 virtqueue_add_split() error: uninitial=
ized symbol 'prev'.
> =

> Regardless, I'll see if I can get this explicitly initialized to avoid
> the new smatch warnings.

I would prefer to leave it as-is rather than silencing it just for
Smatch.  Eventually Smatch will be able to parse these things correctly.

My concern is that eventually GCC will re-enable their uninitialized
variable warning and we will be flooded with warnings.  Maybe when that
happens we will disable the GCC check and only rely on Smatch, though so
maybe that's a good thing.

regards,
dan carpenter
--===============4551673142620746108==--

