Content-Type: multipart/mixed; boundary="===============6946376738288812014=="
MIME-Version: 1.0
From: Dan Carpenter <dan.carpenter@oracle.com>
Subject: Re: drivers/gpu/drm/amd/amdgpu/amdgpu_discovery.c:1433 amdgpu_discovery_get_vcn_info() error: buffer overflow 'adev->vcn.vcn_codec_disable_mask' 2 <= 3
Date: Fri, 27 May 2022 11:12:59 +0300
Message-ID: <20220527081259.GN2168@kadam>
In-Reply-To: <DM5PR12MB246988B514599DF631847549F1D89@DM5PR12MB2469.namprd12.prod.outlook.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============6946376738288812014==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Fri, May 27, 2022 at 07:56:48AM +0000, Chen, Guchun wrote:
> A patch was available already to protect against such scenario.
> =

> https://patchwork.freedesktop.org/patch/486289/ , "drm/amdgpu/discovery: =
validate VCN and SDMA instances"
> =


What?  That's an unrelated patch and it has already been applied so I
took it into consideration when doing my analysis.

regards,
dan carpenter

--===============6946376738288812014==--

