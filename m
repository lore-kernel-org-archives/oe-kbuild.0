Content-Type: multipart/mixed; boundary="===============7881721702669754812=="
MIME-Version: 1.0
From: Dan Carpenter <dan.carpenter@oracle.com>
Subject: Re: [PATCH v3 02/12] KVM: x86: Introduce allow list for MSR emulation
Date: Wed, 02 Sep 2020 10:31:48 +0300
Message-ID: <20200902073147.GI8321@kadam>
In-Reply-To: <79dd5f72-a332-a657-674d-f3a9c94146f1@amazon.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============7881721702669754812==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 01, 2020 at 09:13:10PM +0200, Alexander Graf wrote:
> =

> =

> On 31.08.20 12:39, Dan Carpenter wrote:
> > =

> > Hi Aaron,
> > =

> > url:    https://github.com/0day-ci/linux/commits/Aaron-Lewis/Allow-user=
space-to-manage-MSRs/20200819-051903
> > base:   https://git.kernel.org/pub/scm/virt/kvm/kvm.git  linux-next
> > config: x86_64-randconfig-m001-20200827 (attached as .config)
> > compiler: gcc-9 (Debian 9.3.0-15) 9.3.0
> > =

> > If you fix the issue, kindly add following tag as appropriate
> > Reported-by: kernel test robot <lkp@intel.com>
> > Reported-by: Dan Carpenter <dan.carpenter@oracle.com>
> =

> Thanks a bunch for looking at this! I'd squash in the change with the act=
ual
> patch as it's tiny, so I'm not sure how attribution would work in that ca=
se.

Yep.  No problem.  These are just a template that gets sent to everyone.

> =

> > =

> > smatch warnings:
> > arch/x86/kvm/x86.c:5248 kvm_vm_ioctl_add_msr_allowlist() error: 'bitmap=
' dereferencing possible ERR_PTR()
> > =

> > # https://github.com/0day-ci/linux/commit/107c87325cf461b7b1bd07bb6ddba=
f808a8d8a2a
> > git remote add linux-review https://github.com/0day-ci/linux git fetch
> > --no-tags linux-review
> > Aaron-Lewis/Allow-userspace-to-manage-MSRs/20200819-051903
> > git checkout 107c87325cf461b7b1bd07bb6ddbaf808a8d8a2a
> > vim +/bitmap +5248 arch/x86/kvm/x86.c
> > =

> > 107c87325cf461 Aaron Lewis 2020-08-18  5181  static int kvm_vm_ioctl_ad=
d_msr_allowlist(struct kvm *kvm, void __user *argp)
> > 107c87325cf461 Aaron Lewis 2020-08-18  5182  {
> > 107c87325cf461 Aaron Lewis 2020-08-18  5183     struct msr_bitmap_range=
 *ranges =3D kvm->arch.msr_allowlist_ranges;
> > 107c87325cf461 Aaron Lewis 2020-08-18  5184     struct kvm_msr_allowlis=
t __user *user_msr_allowlist =3D argp;
> > 107c87325cf461 Aaron Lewis 2020-08-18  5185     struct msr_bitmap_range=
 range;
> > 107c87325cf461 Aaron Lewis 2020-08-18  5186     struct kvm_msr_allowlis=
t kernel_msr_allowlist;
> > 107c87325cf461 Aaron Lewis 2020-08-18  5187     unsigned long *bitmap =
=3D NULL;
> > 107c87325cf461 Aaron Lewis 2020-08-18  5188     size_t bitmap_size;
> > 107c87325cf461 Aaron Lewis 2020-08-18  5189     int r =3D 0;
> > 107c87325cf461 Aaron Lewis 2020-08-18  5190
> > 107c87325cf461 Aaron Lewis 2020-08-18  5191     if (copy_from_user(&ker=
nel_msr_allowlist, user_msr_allowlist,
> > 107c87325cf461 Aaron Lewis 2020-08-18  5192                        size=
of(kernel_msr_allowlist))) {
> > 107c87325cf461 Aaron Lewis 2020-08-18  5193             r =3D -EFAULT;
> > 107c87325cf461 Aaron Lewis 2020-08-18  5194             goto out;
> > 107c87325cf461 Aaron Lewis 2020-08-18  5195     }
> > 107c87325cf461 Aaron Lewis 2020-08-18  5196
> > 107c87325cf461 Aaron Lewis 2020-08-18  5197     bitmap_size =3D BITS_TO=
_LONGS(kernel_msr_allowlist.nmsrs) * sizeof(long);
> >                                                                ^^^^^^^^=
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^n
> > On 32 bit systems the BITS_TO_LONGS() can integer overflow if
> > kernel_msr_allowlist.nmsrs is larger than ULONG_MAX - bits_per_long.  In
> > that case bitmap_size is zero.
> =

> Nice catch! It should be enough to ...
> =

> > =

> > 107c87325cf461 Aaron Lewis 2020-08-18  5198     if (bitmap_size > KVM_M=
SR_ALLOWLIST_MAX_LEN) {
> =

> ... add a check for !bitmap_size here as well then, right?

Yup.

regards,
dan carpenter

--===============7881721702669754812==--

