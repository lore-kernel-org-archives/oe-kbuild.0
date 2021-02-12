Content-Type: multipart/mixed; boundary="===============2328591847911615886=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/firmware/google/memconsole-coreboot.c:52:14: warning: Shifting signed 32-bit value by 31 bits is undefined behaviour
Date: Fri, 12 Feb 2021 20:16:13 +0800
Message-ID: <202102122007.fNfzKj2P-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============2328591847911615886==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: Helge Deller <deller@gmx.de>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   dcc0b49040c70ad827a7f3d58a21b01fdb14e749
commit: 024f5b597564acced9e69305f7a9ef1202186a61 parisc: Add qemu fw_cfg in=
terface
date:   4 months ago
:::::: branch date: 13 hours ago
:::::: commit date: 4 months ago
compiler: hppa-linux-gcc (GCC) 9.3.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


cppcheck possible warnings: (new ones prefixed by >>, may not real problems)

>> drivers/firmware/google/memconsole-coreboot.c:52:14: warning: Shifting s=
igned 32-bit value by 31 bits is undefined behaviour [shiftTooManyBitsSigne=
d]
    if (flags & OVERFLOW) {
                ^

vim +52 drivers/firmware/google/memconsole-coreboot.c

d384d6f43d1ec3 Thierry Escande 2017-03-28  32  =

a5061d028594a3 Julius Werner   2017-05-02  33  /*
a5061d028594a3 Julius Werner   2017-05-02  34   * The cbmem_console structu=
re is read again on every access because it may
a5061d028594a3 Julius Werner   2017-05-02  35   * change at any time if run=
time firmware logs new messages. This may rarely
a5061d028594a3 Julius Werner   2017-05-02  36   * lead to race conditions w=
here the firmware overwrites the beginning of the
a5061d028594a3 Julius Werner   2017-05-02  37   * ring buffer with more lin=
es after we have already read |cursor|. It should be
a5061d028594a3 Julius Werner   2017-05-02  38   * rare and harmless enough =
that we don't spend extra effort working around it.
a5061d028594a3 Julius Werner   2017-05-02  39   */
7918cfc46cfad7 Julius Werner   2017-05-02  40  static ssize_t memconsole_co=
reboot_read(char *buf, loff_t pos, size_t count)
7918cfc46cfad7 Julius Werner   2017-05-02  41  {
a5061d028594a3 Julius Werner   2017-05-02  42  	u32 cursor =3D cbmem_consol=
e->cursor & CURSOR_MASK;
a5061d028594a3 Julius Werner   2017-05-02  43  	u32 flags =3D cbmem_console=
->cursor & ~CURSOR_MASK;
40fbb23881291b Julius Werner   2017-05-23  44  	u32 size =3D cbmem_console_=
size;
a5061d028594a3 Julius Werner   2017-05-02  45  	struct seg {	/* describes r=
ing buffer segments in logical order */
a5061d028594a3 Julius Werner   2017-05-02  46  		u32 phys;	/* physical offs=
et from start of mem buffer */
a5061d028594a3 Julius Werner   2017-05-02  47  		u32 len;	/* length of segm=
ent */
a5061d028594a3 Julius Werner   2017-05-02  48  	} seg[2] =3D { {0}, {0} };
a5061d028594a3 Julius Werner   2017-05-02  49  	size_t done =3D 0;
a5061d028594a3 Julius Werner   2017-05-02  50  	int i;
a5061d028594a3 Julius Werner   2017-05-02  51  =

a5061d028594a3 Julius Werner   2017-05-02 @52  	if (flags & OVERFLOW) {
a5061d028594a3 Julius Werner   2017-05-02  53  		if (cursor > size)	/* Shou=
ldn't really happen, but... */
a5061d028594a3 Julius Werner   2017-05-02  54  			cursor =3D 0;
a5061d028594a3 Julius Werner   2017-05-02  55  		seg[0] =3D (struct seg){.p=
hys =3D cursor, .len =3D size - cursor};
a5061d028594a3 Julius Werner   2017-05-02  56  		seg[1] =3D (struct seg){.p=
hys =3D 0, .len =3D cursor};
a5061d028594a3 Julius Werner   2017-05-02  57  	} else {
a5061d028594a3 Julius Werner   2017-05-02  58  		seg[0] =3D (struct seg){.p=
hys =3D 0, .len =3D min(cursor, size)};
a5061d028594a3 Julius Werner   2017-05-02  59  	}
a5061d028594a3 Julius Werner   2017-05-02  60  =

a5061d028594a3 Julius Werner   2017-05-02  61  	for (i =3D 0; i < ARRAY_SIZ=
E(seg) && count > done; i++) {
a5061d028594a3 Julius Werner   2017-05-02  62  		done +=3D memory_read_from=
_buffer(buf + done, count - done, &pos,
a5061d028594a3 Julius Werner   2017-05-02  63  			cbmem_console->body + seg=
[i].phys, seg[i].len);
a5061d028594a3 Julius Werner   2017-05-02  64  		pos -=3D seg[i].len;
a5061d028594a3 Julius Werner   2017-05-02  65  	}
a5061d028594a3 Julius Werner   2017-05-02  66  	return done;
7918cfc46cfad7 Julius Werner   2017-05-02  67  }
7918cfc46cfad7 Julius Werner   2017-05-02  68  =


:::::: The code at line 52 was first introduced by commit
:::::: a5061d028594a31dbf70f4554e0b7d83e5ce770f firmware: google: memconsol=
e: Adapt to new coreboot ring buffer format

:::::: TO: Julius Werner <jwerner@chromium.org>
:::::: CC: Greg Kroah-Hartman <gregkh@linuxfoundation.org>

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============2328591847911615886==--

