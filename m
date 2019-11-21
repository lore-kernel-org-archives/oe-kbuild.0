Content-Type: multipart/mixed; boundary="===============1789129147785322849=="
MIME-Version: 1.0
From: Dan Carpenter <dan.carpenter@oracle.com>
Subject: Re: [wireless-drivers-next:master 8/21] drivers/net/wireless/quantenna/qtnfmac/pcie/pearl_pcie.c:596 qtnf_pcie_skb_send() warn: variable dereferenced before check 'skb' (see line 560)
Date: Thu, 21 Nov 2019 21:54:36 +0300
Message-ID: <20191121185436.GC617@kadam>
In-Reply-To: <a8c4bec3-4108-d460-3766-eb5548d5f878@quantenna.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============1789129147785322849==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 21, 2019 at 04:06:10PM +0000, Igor Mitsyanko wrote:
> Thanks Dan!
> =

> @Sergey I think we do not need !skb check at all in this function, =

> agree? I assume if we remove "if (ret && skb)" it will make smatch happy?
> =


Yes.  Smatch only cares about consistent checking.  Or it will accept
inconsistent NULL checks so long as it is convinced that the pointer
can't be NULL.

regards,
dan carpenter
=20
--===============1789129147785322849==--

