Content-Type: multipart/mixed; boundary="===============3266141195888068718=="
MIME-Version: 1.0
From: Dan Carpenter <dan.carpenter@oracle.com>
Subject: Re: drivers/gpu/drm/amd/amdgpu/amdgpu_discovery.c:1433 amdgpu_discovery_get_vcn_info() error: buffer overflow 'adev->vcn.vcn_codec_disable_mask' 2 <= 3
Date: Thu, 02 Jun 2022 18:33:27 +0300
Message-ID: <20220602153326.GI2168@kadam>
In-Reply-To: <CADnq5_PZBV0wAnNSLSdTc_8acaK3F6ZKDpcgwktmNaR9DKxG9Q@mail.gmail.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============3266141195888068718==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 02, 2022 at 10:24:58AM -0400, Alex Deucher wrote:
> On Thu, Jun 2, 2022 at 7:51 AM Dan Carpenter <dan.carpenter@oracle.com>=
 wrote:
> >
> > On Thu, Jun 02, 2022 at 08:26:03AM +0200, Ernst Sj=C3=B6strand wrote:
> > > Dan: I also ran Smatch which resulted in the following discussion:
> > >
> > > https://lists.freedesktop.org/archives/amd-gfx/2022-May/079228.html =

> >
> > Since the bounds check is dead code which does not make sense and is not
> > required, another idea would be to just delete it.
> =

> It wouldn't be dead code if AMDGPU_MAX_VCN_INSTANCES ever increased.

Or we could add a comment to the code I suppose.

	/* Impossible in 2022 but this check might sense in the future */

regards,
dan carpenter

--===============3266141195888068718==--

