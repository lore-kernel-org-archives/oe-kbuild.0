Content-Type: multipart/mixed; boundary="===============6038975935132599275=="
MIME-Version: 1.0
From: Dan Carpenter <dan.carpenter@oracle.com>
Subject: Re: arch/x86/kvm/x86.c:4988 kvm_arch_tsc_set_attr() warn: check for integer overflow 'offset'
Date: Wed, 12 Oct 2022 09:34:18 +0300
Message-ID: <Y0Zf6g7ahY2b7MBK@kadam>
In-Reply-To: <2c36799c-af38-fed5-3f31-a8bde25368d7@redhat.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============6038975935132599275==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 11, 2022 at 03:02:28PM +0200, Paolo Bonzini wrote:
> On 10/10/22 20:39, Sean Christopherson wrote:
> > > 828ca89628bfcb Oliver Upton 2021-09-16 @4988  		tsc =3D kvm_scale_tsc=
(vcpu, rdtsc(), vcpu->arch.l1_tsc_scaling_ratio) + offset;
> > > =

> > > Smatch hates obvious user triggerable integer overflows...  No checki=
ng
> > > on offset.
> > =

> > This is ok, and even necessary, e.g. if the host TSC > guest TSC.
> =

> (which in fact is the common case).  Also this is unsigned which is fine
> according to the C standard, though I understand that static analyzers wa=
nt
> to be stricter.
> =

> > Is there anything
> > we can do in KVM to help Smatch avoid false positives?  Or do you/Smatc=
h already
> > maintain a list of known false positives?
> =

> Seconded.

Thanks for your feedback.

I could probably make a rule to ignore clock related stuff.  That's
honestly been a known source of false positives for a while.  I kind of
have the infrastructure so it's not super hard to do actually... I'll do
that.

regards,
dan carpenter

--===============6038975935132599275==--

