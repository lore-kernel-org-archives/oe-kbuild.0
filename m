Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05529746A
	for <oe-kbuild@lists.linux.dev>; Mon, 30 Jan 2023 19:33:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1675107200; x=1706643200;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=e9sqguuVfrPOqhzIbZuwFN/pfAljA6GuTo9ZPN3JwBk=;
  b=S+ra8iTIAbR+TS94dKvgSzSrh9QJi012mhWJqe8iId1zvRdvmBOZRlJp
   kB0aHmIxqtj0KHiqIgKobhJwNeVd5adLKMNAAx8SRJSDMZMaGg3LGnCkz
   xPSe0KRr2yP3Io7JirFMFtcpecpwngDBXXOqaIhFGrwei7NsHtpB6OdOn
   w+eiBGIXhluZw2JDkZpeQe3PvEr/mrM0v8oLnclOi73shDdNCnUz31yS1
   UAxID/N5rqQSSeOKpRBgCpn2CgBl0G72ZTLmmVjuxZYOivQFbQuI/wQ8D
   8fMjjDwzW3zlsV1a6nq5Lj1ke52YNjpbXChnyG2kUsTgKFeRUoFWgeB1n
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10606"; a="315612688"
X-IronPort-AV: E=Sophos;i="5.97,259,1669104000"; 
   d="scan'208";a="315612688"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jan 2023 11:33:19 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10606"; a="664220704"
X-IronPort-AV: E=Sophos;i="5.97,259,1669104000"; 
   d="scan'208";a="664220704"
Received: from lkp-server01.sh.intel.com (HELO ffa7f14d1d0f) ([10.239.97.150])
  by orsmga002.jf.intel.com with ESMTP; 30 Jan 2023 11:33:18 -0800
Received: from kbuild by ffa7f14d1d0f with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pMZu1-0003rf-2N;
	Mon, 30 Jan 2023 19:33:17 +0000
Date: Tue, 31 Jan 2023 03:32:37 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [ammarfaizi2-block:dhowells/linux-fs/iov-cifs 11/15]
 include/linux/fortify-string.h:57:33: warning: use of NULL 'iv' where
 non-null expected [CWE-476]
Message-ID: <202301310323.SBG0Y5Dq-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

::::::=20
:::::: Manual check reason: "low confidence bisect report"
:::::: Manual check reason: "low confidence static check first_new_problem:=
 include/linux/fortify-string.h:57:33: warning: use of NULL 'iv' where non-=
null expected [CWE-476] [-Wanalyzer-null-argument]"
::::::=20

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: Ammar Faizi <ammarfaizi2@gnuweeb.org>
CC: "GNU/Weeb Mailing List" <gwml@vger.gnuweeb.org>
TO: David Howells <dhowells@redhat.com>

tree:   https://github.com/ammarfaizi2/linux-block dhowells/linux-fs/iov-ci=
fs
head:   c8c6760ea04e68f89a711c414f56d81946bd2d57
commit: 9f77fe4631af9cc7e82407c9c467b7e0a48271c2 [11/15] cifs: Change the I=
/O paths to use an iterator rather than a page list
:::::: branch date: 3 days ago
:::::: commit date: 4 days ago
config: i386-randconfig-c001-20230130 (https://download.01.org/0day-ci/arch=
ive/20230131/202301310323.SBG0Y5Dq-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-8) 11.3.0
reproduce (this is a W=3D1 build):
        # https://github.com/ammarfaizi2/linux-block/commit/9f77fe4631af9cc=
7e82407c9c467b7e0a48271c2
        git remote add ammarfaizi2-block https://github.com/ammarfaizi2/lin=
ux-block
        git fetch --no-tags ammarfaizi2-block dhowells/linux-fs/iov-cifs
        git checkout 9f77fe4631af9cc7e82407c9c467b7e0a48271c2
        # save the config file
        make ARCH=3Di386 KBUILD_USERCFLAGS=3D'-fanalyzer -Wno-error'  oldde=
fconfig
        make ARCH=3Di386 KBUILD_USERCFLAGS=3D'-fanalyzer -Wno-error'=20

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>

gcc_analyzer warnings: (new ones prefixed by >>)
                     | 4391 |         if (!enc) {
                     |      |         ~~ ~   =20
                     |      |         |  |
                     |      |         |  (49) following 'true' branch (when=
 'enc =3D=3D 0')...
                     |      |         (48) ...to here
                     |
                   'crypt_message': event 50
                     |
                     |include/linux/fortify-string.h:565:62:
                     |  565 |                              p_size_field, q_=
size_field, op) ({         \
                     |      |                                              =
                ^
                     |      |                                              =
                |
                     |      |                                              =
                (50) ...to here
   include/linux/fortify-string.h:623:26: note: in expansion of macro '__fo=
rtify_memcpy_chk'
                     |  623 | #define memcpy(p, q, s)  __fortify_memcpy_chk=
(p, q, s,                  \
                     |      |                          ^~~~~~~~~~~~~~~~~~~~
   fs/cifs/smb2ops.c:4392:17: note: in expansion of macro 'memcpy'
                     | 4392 |                 memcpy(sign, &tr_hdr->Signatu=
re, SMB2_SIGNATURE_SIZE);
                     |      |                 ^~~~~~
                     |
                   'crypt_message': events 51-52
                     |
                     |include/linux/fortify-string.h:538:51:
                     |  538 |         if ((p_size !=3D SIZE_MAX && p_size <=
 size) ||
                     |      |             ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~^~
                     |      |                                              =
     |
                     |      |                                              =
     (51) following 'false' branch (when '__q_size > 15')...
                     |  539 |             (q_size !=3D SIZE_MAX && q_size <=
 size))
                     |      |             ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~ =20
                     |......
                     |  557 |         if (p_size_field !=3D 0 && p_size_fie=
ld !=3D SIZE_MAX &&
                     |      |         ~~                                   =
     =20
                     |      |         |
                     |      |         (52) ...to here
                     |
                   'crypt_message': event 53
                     |
                     |fs/cifs/smb2ops.c:4396:12:
                     | 4396 |         if ((server->cipher_type =3D=3D SMB2_=
ENCRYPTION_AES128_GCM) ||
                     |      |            ^
                     |      |            |
                     |      |            (53) following 'true' branch...
                     |
                   'crypt_message': event 54
                     |
                     |include/linux/fortify-string.h:565:62:
                     |  565 |                              p_size_field, q_=
size_field, op) ({         \
                     |      |                                              =
                ^
                     |      |                                              =
                |
                     |      |                                              =
                (54) ...to here
   include/linux/fortify-string.h:623:26: note: in expansion of macro '__fo=
rtify_memcpy_chk'
                     |  623 | #define memcpy(p, q, s)  __fortify_memcpy_chk=
(p, q, s,                  \
                     |      |                          ^~~~~~~~~~~~~~~~~~~~
   fs/cifs/smb2ops.c:4398:17: note: in expansion of macro 'memcpy'
                     | 4398 |                 memcpy(iv, (char *)tr_hdr->No=
nce, SMB3_AES_GCM_NONCE);
                     |      |                 ^~~~~~
                     |
                   'crypt_message': events 55-56
                     |
                     |include/linux/fortify-string.h:538:12:
                     |  538 |         if ((p_size !=3D SIZE_MAX && p_size <=
 size) ||
                     |      |            ^
                     |      |            |
                     |      |            (55) following 'false' branch...
                     |......
                     |  557 |         if (p_size_field !=3D 0 && p_size_fie=
ld !=3D SIZE_MAX &&
                     |      |         ~~ =20
                     |      |         |
                     |      |         (56) ...to here
                     |
                   'crypt_message': events 57-58
                     |
                     |fs/cifs/smb2ops.c:4404:9:
                     | 4404 |         aead_request_set_tfm(req, tfm);
                     |      |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
                     |      |         |
                     |      |         (57) 'req' is NULL
                     |      |         (58) 'req' is NULL
                     |
                   'crypt_message': event 59
                     |
                     |include/crypto/aead.h:510:18:
                     |  510 |         req->src =3D src;
                     |      |         ~~~~~~~~~^~~~~
                     |      |                  |
                     |      |                  (59) dereference of NULL 're=
q'
                     |
   In file included from include/linux/string.h:253,
                    from arch/x86/include/asm/page_32.h:22,
                    from arch/x86/include/asm/page.h:14,
                    from arch/x86/include/asm/thread_info.h:12,
                    from include/linux/thread_info.h:60,
                    from arch/x86/include/asm/preempt.h:9,
                    from include/linux/preempt.h:78,
                    from include/linux/spinlock.h:56,
                    from include/linux/mmzone.h:8,
                    from include/linux/gfp.h:7,
                    from include/linux/mm.h:7,
                    from include/linux/pagemap.h:8,
                    from fs/cifs/smb2ops.c:8:
>> include/linux/fortify-string.h:57:33: warning: use of NULL 'iv' where no=
n-null expected [CWE-476] [-Wanalyzer-null-argument]
      57 | #define __underlying_memcpy     __builtin_memcpy
         |                                 ^
   include/linux/fortify-string.h:578:9: note: in expansion of macro '__und=
erlying_memcpy'
     578 |         __underlying_##op(p, q, __fortify_size);                =
        \
         |         ^~~~~~~~~~~~~
   include/linux/fortify-string.h:623:26: note: in expansion of macro '__fo=
rtify_memcpy_chk'
     623 | #define memcpy(p, q, s)  __fortify_memcpy_chk(p, q, s,          =
        \
         |                          ^~~~~~~~~~~~~~~~~~~~
   fs/cifs/smb2ops.c:4398:17: note: in expansion of macro 'memcpy'
    4398 |                 memcpy(iv, (char *)tr_hdr->Nonce, SMB3_AES_GCM_N=
ONCE);
         |                 ^~~~~~
     'smb2_decrypt_offload': events 1-2
       |
       | 4751 | static void smb2_decrypt_offload(struct work_struct *work)
       |      |             ^~~~~~~~~~~~~~~~~~~~
       |      |             |
       |      |             (1) entry to 'smb2_decrypt_offload'
       |......
       | 4760 |         rc =3D decrypt_raw_data(dw->server, dw->buf, dw->se=
rver->vals->read_rsp_size,
       |      |              ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~~~~~~~~~~~~~~~~~~
       |      |              |
       |      |              (2) calling 'decrypt_raw_data' from 'smb2_decr=
ypt_offload'
       | 4761 |                               &iter, true);
       |      |                               ~~~~~~~~~~~~
       |
       +--> 'decrypt_raw_data': events 3-6
              |
              | 4537 | decrypt_raw_data(struct TCP_Server_Info *server, cha=
r *buf,
              |      | ^~~~~~~~~~~~~~~~
              |      | |
              |      | (3) entry to 'decrypt_raw_data'
              |......
              | 4553 |         if (iter) {
              |      |            ~
              |      |            |
              |      |            (4) following 'true' branch (when 'iter' =
is non-NULL)...
              | 4554 |                 rqst.rq_iter =3D *iter;
              |      |                 ~~~~
              |      |                 |
              |      |                 (5) ...to here
              |......
              | 4558 |         rc =3D crypt_message(server, 1, &rqst, 0);
              |      |              ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
              |      |              |
              |      |              (6) calling 'crypt_message' from 'decry=
pt_raw_data'
              |
              +--> 'crypt_message': event 7
                     |
                     | 4338 | crypt_message(struct TCP_Server_Info *server,=
 int num_rqst,
                     |      | ^~~~~~~~~~~~~
                     |      | |
                     |      | (7) entry to 'crypt_message'
                     |
                   'crypt_message': event 8
                     |
                     |cc1:
                     | (8): '=1B[01m=1B[Kiv=1B[m=1B[K' is NULL
                     |
                   'crypt_message': event 9
                     |
                     | 4355 |         rc =3D smb2_get_enc_key(server, le64_=
to_cpu(tr_hdr->SessionId), enc, key);
                     |      |              ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
                     |      |              |
                     |      |              (9) calling 'smb2_get_enc_key' f=
rom 'crypt_message'
                     |
                     +--> 'smb2_get_enc_key': events 10-12
                            |
                            | 4305 | smb2_get_enc_key(struct TCP_Server_Inf=
o *server, __u64 ses_id, int enc, u8 *key)
                            |      | ^~~~~~~~~~~~~~~~
                            |      | |
                            |      | (10) entry to 'smb2_get_enc_key'
                            |......
                            | 4318 |                         ses_enc_key =
=3D enc ? ses->smb3encryptionkey :
                            |      |                         ~~~~~~~~~~~~~~=
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
                            |      |                                     |
                            |      |                                     (1=
1) following 'false' branch (when 'enc =3D=3D 0')...
                            |      |                                     (1=
2) ...to here
                            | 4319 |                                 ses->s=
mb3decryptionkey;
                            |      |                                 ~~~~~~=
~~~~~~~~~~~~~~~~
                            |
                          'smb2_get_enc_key': events 13-14
                            |
                            |include/linux/fortify-string.h:538:12:
                            |  538 |         if ((p_size !=3D SIZE_MAX && p=
_size < size) ||
                            |      |            ^
                            |      |            |
                            |      |            (13) following 'false' bran=
ch...
                            |......
                            |  557 |         if (p_size_field !=3D 0 && p_s=
ize_field !=3D SIZE_MAX &&
                            |      |         ~~ =20
                            |      |         |
                            |      |         (14) ...to here
                            |
                     <------+
                     |
                   'crypt_message': events 15-26
                     |
                     |fs/cifs/smb2ops.c:4355:14:
                     | 4355 |         rc =3D smb2_get_enc_key(server, le64_=
to_cpu(tr_hdr->SessionId), enc, key);
                     |      |              ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

vim +/iv +57 include/linux/fortify-string.h

78a498c3a227f2a Alexander Potapenko 2022-10-24  46 =20
78a498c3a227f2a Alexander Potapenko 2022-10-24  47  #if defined(__SANITIZE_=
MEMORY__)
78a498c3a227f2a Alexander Potapenko 2022-10-24  48  /*
78a498c3a227f2a Alexander Potapenko 2022-10-24  49   * For KMSAN builds all=
 memcpy/memset/memmove calls should be replaced by the
78a498c3a227f2a Alexander Potapenko 2022-10-24  50   * corresponding __msan=
_XXX functions.
78a498c3a227f2a Alexander Potapenko 2022-10-24  51   */
78a498c3a227f2a Alexander Potapenko 2022-10-24  52  #include <linux/kmsan_s=
tring.h>
78a498c3a227f2a Alexander Potapenko 2022-10-24  53  #define __underlying_me=
mcpy	__msan_memcpy
78a498c3a227f2a Alexander Potapenko 2022-10-24  54  #define __underlying_me=
mmove	__msan_memmove
78a498c3a227f2a Alexander Potapenko 2022-10-24  55  #define __underlying_me=
mset	__msan_memset
78a498c3a227f2a Alexander Potapenko 2022-10-24  56  #else
a28a6e860c6cf23 Francis Laniel      2021-02-25 @57  #define __underlying_me=
mcpy	__builtin_memcpy
a28a6e860c6cf23 Francis Laniel      2021-02-25  58  #define __underlying_me=
mmove	__builtin_memmove
a28a6e860c6cf23 Francis Laniel      2021-02-25  59  #define __underlying_me=
mset	__builtin_memset
78a498c3a227f2a Alexander Potapenko 2022-10-24  60  #endif
78a498c3a227f2a Alexander Potapenko 2022-10-24  61 =20

:::::: The code at line 57 was first introduced by commit
:::::: a28a6e860c6cf231cf3c5171c75c342adcd00406 string.h: move fortified fu=
nctions definitions in a dedicated header.

:::::: TO: Francis Laniel <laniel_francis@privacyrequired.com>
:::::: CC: Linus Torvalds <torvalds@linux-foundation.org>

--=20
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
