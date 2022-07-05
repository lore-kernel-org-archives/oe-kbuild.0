Content-Type: multipart/mixed; boundary="===============4842425855228014309=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [linux-next:master 3020/7896] fs/kernel_read_file.c:61 kernel_read_file() warn: impossible condition '(i_size > (((~0) >> 1))) => (s64min-s64max > s64max)'
Date: Wed, 06 Jul 2022 07:12:17 +0800
Message-ID: <202207060720.R0Ae1Qey-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============4842425855228014309==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: Linux Memory Management List <linux-mm@kvack.org>
TO: Pasha Tatashin <pasha.tatashin@soleen.com>
CC: Andrew Morton <akpm@linux-foundation.org>
CC: Linux Memory Management List <linux-mm@kvack.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git=
 master
head:   2a2aa3f05338270aecbe2492fda910d6c17e0102
commit: dabba87229411a5e9d20ac03ffc36463c53ae672 [3020/7896] fs/kernel_read=
_file: allow to read files up-to ssize_t
:::::: branch date: 16 hours ago
:::::: commit date: 3 weeks ago
config: x86_64-randconfig-m001-20220704 (https://download.01.org/0day-ci/ar=
chive/20220706/202207060720.R0Ae1Qey-lkp(a)intel.com/config)
compiler: gcc-11 (Debian 11.3.0-3) 11.3.0

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

smatch warnings:
fs/kernel_read_file.c:61 kernel_read_file() warn: impossible condition '(i_=
size > (((~0) >> 1))) =3D> (s64min-s64max > s64max)'

vim +61 fs/kernel_read_file.c

5287b07f6d7cc3 Kees Cook      2020-10-02    7  =

113eeb517780ad Kees Cook      2020-10-02    8  /**
113eeb517780ad Kees Cook      2020-10-02    9   * kernel_read_file() - read=
 file contents into a kernel buffer
113eeb517780ad Kees Cook      2020-10-02   10   *
113eeb517780ad Kees Cook      2020-10-02   11   * @file	file to read from
0fa8e084648779 Kees Cook      2020-10-02   12   * @offset	where to start re=
ading from (see below).
113eeb517780ad Kees Cook      2020-10-02   13   * @buf		pointer to a "void =
*" buffer for reading into (if
113eeb517780ad Kees Cook      2020-10-02   14   *		*@buf is NULL, a buffer =
will be allocated, and
113eeb517780ad Kees Cook      2020-10-02   15   *		@buf_size will be ignore=
d)
113eeb517780ad Kees Cook      2020-10-02   16   * @buf_size	size of buf, if=
 already allocated. If @buf not
113eeb517780ad Kees Cook      2020-10-02   17   *		allocated, this is the l=
argest size to allocate.
885352881f11f1 Kees Cook      2020-10-02   18   * @file_size	if non-NULL, t=
he full size of @file will be
885352881f11f1 Kees Cook      2020-10-02   19   *		written here.
113eeb517780ad Kees Cook      2020-10-02   20   * @id		the kernel_read_file=
_id identifying the type of
113eeb517780ad Kees Cook      2020-10-02   21   *		file contents being read=
 (for LSMs to examine)
113eeb517780ad Kees Cook      2020-10-02   22   *
0fa8e084648779 Kees Cook      2020-10-02   23   * @offset must be 0 unless =
both @buf and @file_size are non-NULL
0fa8e084648779 Kees Cook      2020-10-02   24   * (i.e. the caller must be =
expecting to read partial file contents
0fa8e084648779 Kees Cook      2020-10-02   25   * via an already-allocated =
@buf, in at most @buf_size chunks, and
0fa8e084648779 Kees Cook      2020-10-02   26   * will be able to determine=
 when the entire file was read by
0fa8e084648779 Kees Cook      2020-10-02   27   * checking @file_size). Thi=
s isn't a recommended way to read a
0fa8e084648779 Kees Cook      2020-10-02   28   * file, though, since it is=
 possible that the contents might
0fa8e084648779 Kees Cook      2020-10-02   29   * change between calls to k=
ernel_read_file().
0fa8e084648779 Kees Cook      2020-10-02   30   *
113eeb517780ad Kees Cook      2020-10-02   31   * Returns number of bytes r=
ead (no single read will be bigger
dabba87229411a Pasha Tatashin 2022-05-27   32   * than SSIZE_MAX), or negat=
ive on error.
113eeb517780ad Kees Cook      2020-10-02   33   *
113eeb517780ad Kees Cook      2020-10-02   34   */
dabba87229411a Pasha Tatashin 2022-05-27   35  ssize_t kernel_read_file(str=
uct file *file, loff_t offset, void **buf,
885352881f11f1 Kees Cook      2020-10-02   36  			 size_t buf_size, size_t =
*file_size,
885352881f11f1 Kees Cook      2020-10-02   37  			 enum kernel_read_file_id=
 id)
5287b07f6d7cc3 Kees Cook      2020-10-02   38  {
5287b07f6d7cc3 Kees Cook      2020-10-02   39  	loff_t i_size, pos;
dabba87229411a Pasha Tatashin 2022-05-27   40  	ssize_t copied;
5287b07f6d7cc3 Kees Cook      2020-10-02   41  	void *allocated =3D NULL;
0fa8e084648779 Kees Cook      2020-10-02   42  	bool whole_file;
5287b07f6d7cc3 Kees Cook      2020-10-02   43  	int ret;
5287b07f6d7cc3 Kees Cook      2020-10-02   44  =

0fa8e084648779 Kees Cook      2020-10-02   45  	if (offset !=3D 0 && (!*buf=
 || !file_size))
0fa8e084648779 Kees Cook      2020-10-02   46  		return -EINVAL;
0fa8e084648779 Kees Cook      2020-10-02   47  =

113eeb517780ad Kees Cook      2020-10-02   48  	if (!S_ISREG(file_inode(fil=
e)->i_mode))
5287b07f6d7cc3 Kees Cook      2020-10-02   49  		return -EINVAL;
5287b07f6d7cc3 Kees Cook      2020-10-02   50  =

5287b07f6d7cc3 Kees Cook      2020-10-02   51  	ret =3D deny_write_access(f=
ile);
5287b07f6d7cc3 Kees Cook      2020-10-02   52  	if (ret)
5287b07f6d7cc3 Kees Cook      2020-10-02   53  		return ret;
5287b07f6d7cc3 Kees Cook      2020-10-02   54  =

5287b07f6d7cc3 Kees Cook      2020-10-02   55  	i_size =3D i_size_read(file=
_inode(file));
5287b07f6d7cc3 Kees Cook      2020-10-02   56  	if (i_size <=3D 0) {
5287b07f6d7cc3 Kees Cook      2020-10-02   57  		ret =3D -EINVAL;
5287b07f6d7cc3 Kees Cook      2020-10-02   58  		goto out;
5287b07f6d7cc3 Kees Cook      2020-10-02   59  	}
0fa8e084648779 Kees Cook      2020-10-02   60  	/* The file is too big for =
sane activities. */
dabba87229411a Pasha Tatashin 2022-05-27  @61  	if (i_size > SSIZE_MAX) {
5287b07f6d7cc3 Kees Cook      2020-10-02   62  		ret =3D -EFBIG;
5287b07f6d7cc3 Kees Cook      2020-10-02   63  		goto out;
5287b07f6d7cc3 Kees Cook      2020-10-02   64  	}
0fa8e084648779 Kees Cook      2020-10-02   65  	/* The entire file cannot b=
e read in one buffer. */
0fa8e084648779 Kees Cook      2020-10-02   66  	if (!file_size && offset =
=3D=3D 0 && i_size > buf_size) {
0fa8e084648779 Kees Cook      2020-10-02   67  		ret =3D -EFBIG;
0fa8e084648779 Kees Cook      2020-10-02   68  		goto out;
0fa8e084648779 Kees Cook      2020-10-02   69  	}
0fa8e084648779 Kees Cook      2020-10-02   70  =

0fa8e084648779 Kees Cook      2020-10-02   71  	whole_file =3D (offset =3D=
=3D 0 && i_size <=3D buf_size);
0fa8e084648779 Kees Cook      2020-10-02   72  	ret =3D security_kernel_rea=
d_file(file, id, whole_file);
0fa8e084648779 Kees Cook      2020-10-02   73  	if (ret)
0fa8e084648779 Kees Cook      2020-10-02   74  		goto out;
0fa8e084648779 Kees Cook      2020-10-02   75  =

885352881f11f1 Kees Cook      2020-10-02   76  	if (file_size)
885352881f11f1 Kees Cook      2020-10-02   77  		*file_size =3D i_size;
5287b07f6d7cc3 Kees Cook      2020-10-02   78  =

5287b07f6d7cc3 Kees Cook      2020-10-02   79  	if (!*buf)
5287b07f6d7cc3 Kees Cook      2020-10-02   80  		*buf =3D allocated =3D vma=
lloc(i_size);
5287b07f6d7cc3 Kees Cook      2020-10-02   81  	if (!*buf) {
5287b07f6d7cc3 Kees Cook      2020-10-02   82  		ret =3D -ENOMEM;
5287b07f6d7cc3 Kees Cook      2020-10-02   83  		goto out;
5287b07f6d7cc3 Kees Cook      2020-10-02   84  	}
5287b07f6d7cc3 Kees Cook      2020-10-02   85  =

0fa8e084648779 Kees Cook      2020-10-02   86  	pos =3D offset;
0fa8e084648779 Kees Cook      2020-10-02   87  	copied =3D 0;
0fa8e084648779 Kees Cook      2020-10-02   88  	while (copied < buf_size) {
0fa8e084648779 Kees Cook      2020-10-02   89  		ssize_t bytes;
0fa8e084648779 Kees Cook      2020-10-02   90  		size_t wanted =3D min_t(si=
ze_t, buf_size - copied,
0fa8e084648779 Kees Cook      2020-10-02   91  					      i_size - pos);
0fa8e084648779 Kees Cook      2020-10-02   92  =

0fa8e084648779 Kees Cook      2020-10-02   93  		bytes =3D kernel_read(file=
, *buf + copied, wanted, &pos);
5287b07f6d7cc3 Kees Cook      2020-10-02   94  		if (bytes < 0) {
5287b07f6d7cc3 Kees Cook      2020-10-02   95  			ret =3D bytes;
5287b07f6d7cc3 Kees Cook      2020-10-02   96  			goto out_free;
5287b07f6d7cc3 Kees Cook      2020-10-02   97  		}
5287b07f6d7cc3 Kees Cook      2020-10-02   98  =

5287b07f6d7cc3 Kees Cook      2020-10-02   99  		if (bytes =3D=3D 0)
5287b07f6d7cc3 Kees Cook      2020-10-02  100  			break;
0fa8e084648779 Kees Cook      2020-10-02  101  		copied +=3D bytes;
5287b07f6d7cc3 Kees Cook      2020-10-02  102  	}
5287b07f6d7cc3 Kees Cook      2020-10-02  103  =

0fa8e084648779 Kees Cook      2020-10-02  104  	if (whole_file) {
5287b07f6d7cc3 Kees Cook      2020-10-02  105  		if (pos !=3D i_size) {
5287b07f6d7cc3 Kees Cook      2020-10-02  106  			ret =3D -EIO;
5287b07f6d7cc3 Kees Cook      2020-10-02  107  			goto out_free;
5287b07f6d7cc3 Kees Cook      2020-10-02  108  		}
5287b07f6d7cc3 Kees Cook      2020-10-02  109  =

5287b07f6d7cc3 Kees Cook      2020-10-02  110  		ret =3D security_kernel_po=
st_read_file(file, *buf, i_size, id);
0fa8e084648779 Kees Cook      2020-10-02  111  	}
5287b07f6d7cc3 Kees Cook      2020-10-02  112  =

5287b07f6d7cc3 Kees Cook      2020-10-02  113  out_free:
5287b07f6d7cc3 Kees Cook      2020-10-02  114  	if (ret < 0) {
5287b07f6d7cc3 Kees Cook      2020-10-02  115  		if (allocated) {
5287b07f6d7cc3 Kees Cook      2020-10-02  116  			vfree(*buf);
5287b07f6d7cc3 Kees Cook      2020-10-02  117  			*buf =3D NULL;
5287b07f6d7cc3 Kees Cook      2020-10-02  118  		}
5287b07f6d7cc3 Kees Cook      2020-10-02  119  	}
5287b07f6d7cc3 Kees Cook      2020-10-02  120  =

5287b07f6d7cc3 Kees Cook      2020-10-02  121  out:
5287b07f6d7cc3 Kees Cook      2020-10-02  122  	allow_write_access(file);
0fa8e084648779 Kees Cook      2020-10-02  123  	return ret =3D=3D 0 ? copie=
d : ret;
5287b07f6d7cc3 Kees Cook      2020-10-02  124  }
5287b07f6d7cc3 Kees Cook      2020-10-02  125  EXPORT_SYMBOL_GPL(kernel_rea=
d_file);
5287b07f6d7cc3 Kees Cook      2020-10-02  126  =


-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============4842425855228014309==--

