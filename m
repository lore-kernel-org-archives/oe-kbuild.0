Content-Type: multipart/mixed; boundary="===============1678976943128473334=="
MIME-Version: 1.0
From: Dan Carpenter <dan.carpenter@oracle.com>
Subject: Re: drivers/gpu/drm/amd/amdgpu/amdgpu_discovery.c:1433 amdgpu_discovery_get_vcn_info() error: buffer overflow 'adev->vcn.vcn_codec_disable_mask' 2 <= 3
Date: Thu, 02 Jun 2022 14:50:46 +0300
Message-ID: <20220602115046.GH2168@kadam>
In-Reply-To: <CAD=4a=WRbp8w4DA2c6hE7W5A2-woRyHLvtC-GPitFwQireCeNw@mail.gmail.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============1678976943128473334==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 02, 2022 at 08:26:03AM +0200, Ernst Sj=C3=B6strand wrote:
> Dan: I also ran Smatch which resulted in the following discussion:
> =

> https://lists.freedesktop.org/archives/amd-gfx/2022-May/079228.html =


Since the bounds check is dead code which does not make sense and is not
required, another idea would be to just delete it.

regards,
dan carpenter

--===============1678976943128473334==--

