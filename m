Content-Type: multipart/mixed; boundary="===============3483034627104805972=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [linusw-nomadik:ux500-golden-v5.18-rc1 1/2] drivers/gpu/drm/panel/panel-samsung-s6e63m0.c:755:3: warning: Value stored to 'ret' is never read [clang-analyzer-deadcode.DeadStores]
Date: Thu, 07 Apr 2022 09:14:44 +0800
Message-ID: <202204070929.GOmCSBy9-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============3483034627104805972==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: llvm(a)lists.linux.dev
CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: linux-arm-kernel(a)lists.infradead.org
TO: Linus Walleij <linus.walleij@linaro.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-nomadi=
k.git ux500-golden-v5.18-rc1
head:   5f95e0e02cd1bab6859714e9b499d1671f83b65a
commit: ed5a6c74c4dbf9cbf8254a6f5a45c9cd61f74060 [1/2] drm/panel: s6e63m0: =
Register ESD IRQ handler
:::::: branch date: 2 days ago
:::::: commit date: 2 days ago
config: arm-randconfig-c002-20220405 (https://download.01.org/0day-ci/archi=
ve/20220407/202204070929.GOmCSBy9-lkp(a)intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project c4a1b0=
7d0979e7ff20d7d541af666d822d66b566)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install arm cross compiling tool for clang build
        # apt-get install binutils-arm-linux-gnueabi
        # https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-noma=
dik.git/commit/?id=3Ded5a6c74c4dbf9cbf8254a6f5a45c9cd61f74060
        git remote add linusw-nomadik https://git.kernel.org/pub/scm/linux/=
kernel/git/linusw/linux-nomadik.git
        git fetch --no-tags linusw-nomadik ux500-golden-v5.18-rc1
        git checkout ed5a6c74c4dbf9cbf8254a6f5a45c9cd61f74060
        # save the config file to linux build tree
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Darm clang-analyzer =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


clang-analyzer warnings: (new ones prefixed by >>)
           ^~~~~~
   fs/ext4/ioctl.c:1117:2: note: Call to function 'memset' is insecure as i=
t does not provide security checks introduced in the C11 standard. Replace =
with analogous functions that support length arguments or provides boundary=
 checks such as 'memset_s' in case of C11
           memset(new_label + len, 0, EXT4_LABEL_MAX - len);
           ^~~~~~
   fs/ext4/ioctl.c:1140:2: warning: Call to function 'memset' is insecure a=
s it does not provide security checks introduced in the C11 standard. Repla=
ce with analogous functions that support length arguments or provides bound=
ary checks such as 'memset_s' in case of C11 [clang-analyzer-security.insec=
ureAPI.DeprecatedOrUnsafeBufferHandling]
           memset(label, 0, sizeof(label));
           ^~~~~~
   fs/ext4/ioctl.c:1140:2: note: Call to function 'memset' is insecure as i=
t does not provide security checks introduced in the C11 standard. Replace =
with analogous functions that support length arguments or provides boundary=
 checks such as 'memset_s' in case of C11
           memset(label, 0, sizeof(label));
           ^~~~~~
   fs/ext4/ioctl.c:1142:2: warning: Call to function 'strncpy' is insecure =
as it does not provide security checks introduced in the C11 standard. Repl=
ace with analogous functions that support length arguments or provides boun=
dary checks such as 'strncpy_s' in case of C11 [clang-analyzer-security.ins=
ecureAPI.DeprecatedOrUnsafeBufferHandling]
           strncpy(label, sbi->s_es->s_volume_name, EXT4_LABEL_MAX);
           ^~~~~~~
   fs/ext4/ioctl.c:1142:2: note: Call to function 'strncpy' is insecure as =
it does not provide security checks introduced in the C11 standard. Replace=
 with analogous functions that support length arguments or provides boundar=
y checks such as 'strncpy_s' in case of C11
           strncpy(label, sbi->s_es->s_volume_name, EXT4_LABEL_MAX);
           ^~~~~~~
   Suppressed 45 warnings (45 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   52 warnings generated.
   drivers/crypto/sahara.c:453:3: warning: Call to function 'memcpy' is ins=
ecure as it does not provide security checks introduced in the C11 standard=
. Replace with analogous functions that support length arguments or provide=
s boundary checks such as 'memcpy_s' in case of C11 [clang-analyzer-securit=
y.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   memcpy(dev->key_base, ctx->key, ctx->keylen);
                   ^~~~~~
   drivers/crypto/sahara.c:453:3: note: Call to function 'memcpy' is insecu=
re as it does not provide security checks introduced in the C11 standard. R=
eplace with analogous functions that support length arguments or provides b=
oundary checks such as 'memcpy_s' in case of C11
                   memcpy(dev->key_base, ctx->key, ctx->keylen);
                   ^~~~~~
   drivers/crypto/sahara.c:576:3: warning: Call to function 'memcpy' is ins=
ecure as it does not provide security checks introduced in the C11 standard=
. Replace with analogous functions that support length arguments or provide=
s boundary checks such as 'memcpy_s' in case of C11 [clang-analyzer-securit=
y.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   memcpy(dev->iv_base, req->iv, AES_KEYSIZE_128);
                   ^~~~~~
   drivers/crypto/sahara.c:576:3: note: Call to function 'memcpy' is insecu=
re as it does not provide security checks introduced in the C11 standard. R=
eplace with analogous functions that support length arguments or provides b=
oundary checks such as 'memcpy_s' in case of C11
                   memcpy(dev->iv_base, req->iv, AES_KEYSIZE_128);
                   ^~~~~~
   drivers/crypto/sahara.c:611:3: warning: Call to function 'memcpy' is ins=
ecure as it does not provide security checks introduced in the C11 standard=
. Replace with analogous functions that support length arguments or provide=
s boundary checks such as 'memcpy_s' in case of C11 [clang-analyzer-securit=
y.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   memcpy(ctx->key, key, keylen);
                   ^~~~~~
   drivers/crypto/sahara.c:611:3: note: Call to function 'memcpy' is insecu=
re as it does not provide security checks introduced in the C11 standard. R=
eplace with analogous functions that support length arguments or provides b=
oundary checks such as 'memcpy_s' in case of C11
                   memcpy(ctx->key, key, keylen);
                   ^~~~~~
   drivers/crypto/sahara.c:937:3: warning: Call to function 'memcpy' is ins=
ecure as it does not provide security checks introduced in the C11 standard=
. Replace with analogous functions that support length arguments or provide=
s boundary checks such as 'memcpy_s' in case of C11 [clang-analyzer-securit=
y.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   memcpy(rctx->rembuf, rctx->buf, rctx->buf_cnt);
                   ^~~~~~
   drivers/crypto/sahara.c:937:3: note: Call to function 'memcpy' is insecu=
re as it does not provide security checks introduced in the C11 standard. R=
eplace with analogous functions that support length arguments or provides b=
oundary checks such as 'memcpy_s' in case of C11
                   memcpy(rctx->rembuf, rctx->buf, rctx->buf_cnt);
                   ^~~~~~
   drivers/crypto/sahara.c:1002:3: warning: Call to function 'memcpy' is in=
secure as it does not provide security checks introduced in the C11 standar=
d. Replace with analogous functions that support length arguments or provid=
es boundary checks such as 'memcpy_s' in case of C11 [clang-analyzer-securi=
ty.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   memcpy(dev->context_base, rctx->context, rctx->context_s=
ize);
                   ^~~~~~
   drivers/crypto/sahara.c:1002:3: note: Call to function 'memcpy' is insec=
ure as it does not provide security checks introduced in the C11 standard. =
Replace with analogous functions that support length arguments or provides =
boundary checks such as 'memcpy_s' in case of C11
                   memcpy(dev->context_base, rctx->context, rctx->context_s=
ize);
                   ^~~~~~
   drivers/crypto/sahara.c:1028:2: warning: Call to function 'memcpy' is in=
secure as it does not provide security checks introduced in the C11 standar=
d. Replace with analogous functions that support length arguments or provid=
es boundary checks such as 'memcpy_s' in case of C11 [clang-analyzer-securi=
ty.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memcpy(rctx->context, dev->context_base, rctx->context_size);
           ^~~~~~
   drivers/crypto/sahara.c:1028:2: note: Call to function 'memcpy' is insec=
ure as it does not provide security checks introduced in the C11 standard. =
Replace with analogous functions that support length arguments or provides =
boundary checks such as 'memcpy_s' in case of C11
           memcpy(rctx->context, dev->context_base, rctx->context_size);
           ^~~~~~
   drivers/crypto/sahara.c:1031:3: warning: Call to function 'memcpy' is in=
secure as it does not provide security checks introduced in the C11 standar=
d. Replace with analogous functions that support length arguments or provid=
es boundary checks such as 'memcpy_s' in case of C11 [clang-analyzer-securi=
ty.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   memcpy(req->result, rctx->context, rctx->digest_size);
                   ^~~~~~
   drivers/crypto/sahara.c:1031:3: note: Call to function 'memcpy' is insec=
ure as it does not provide security checks introduced in the C11 standard. =
Replace with analogous functions that support length arguments or provides =
boundary checks such as 'memcpy_s' in case of C11
                   memcpy(req->result, rctx->context, rctx->digest_size);
                   ^~~~~~
   drivers/crypto/sahara.c:1109:2: warning: Call to function 'memset' is in=
secure as it does not provide security checks introduced in the C11 standar=
d. Replace with analogous functions that support length arguments or provid=
es boundary checks such as 'memset_s' in case of C11 [clang-analyzer-securi=
ty.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memset(rctx, 0, sizeof(*rctx));
           ^~~~~~
   drivers/crypto/sahara.c:1109:2: note: Call to function 'memset' is insec=
ure as it does not provide security checks introduced in the C11 standard. =
Replace with analogous functions that support length arguments or provides =
boundary checks such as 'memset_s' in case of C11
           memset(rctx, 0, sizeof(*rctx));
           ^~~~~~
   drivers/crypto/sahara.c:1157:2: warning: Call to function 'memcpy' is in=
secure as it does not provide security checks introduced in the C11 standar=
d. Replace with analogous functions that support length arguments or provid=
es boundary checks such as 'memcpy_s' in case of C11 [clang-analyzer-securi=
ty.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memcpy(out, rctx, sizeof(struct sahara_sha_reqctx));
           ^~~~~~
   drivers/crypto/sahara.c:1157:2: note: Call to function 'memcpy' is insec=
ure as it does not provide security checks introduced in the C11 standard. =
Replace with analogous functions that support length arguments or provides =
boundary checks such as 'memcpy_s' in case of C11
           memcpy(out, rctx, sizeof(struct sahara_sha_reqctx));
           ^~~~~~
   drivers/crypto/sahara.c:1166:2: warning: Call to function 'memcpy' is in=
secure as it does not provide security checks introduced in the C11 standar=
d. Replace with analogous functions that support length arguments or provid=
es boundary checks such as 'memcpy_s' in case of C11 [clang-analyzer-securi=
ty.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memcpy(rctx, in, sizeof(struct sahara_sha_reqctx));
           ^~~~~~
   drivers/crypto/sahara.c:1166:2: note: Call to function 'memcpy' is insec=
ure as it does not provide security checks introduced in the C11 standard. =
Replace with analogous functions that support length arguments or provides =
boundary checks such as 'memcpy_s' in case of C11
           memcpy(rctx, in, sizeof(struct sahara_sha_reqctx));
           ^~~~~~
   Suppressed 42 warnings (42 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   42 warnings generated.
   Suppressed 42 warnings (42 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   42 warnings generated.
   Suppressed 42 warnings (42 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   42 warnings generated.
   drivers/gpu/drm/panel/panel-samsung-s6e3ha2.c:439:2: warning: Call to fu=
nction 'memcpy' is insecure as it does not provide security checks introduc=
ed in the C11 standard. Replace with analogous functions that support lengt=
h arguments or provides boundary checks such as 'memcpy_s' in case of C11 [=
clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memcpy(data + 1, gamma_tbl + index, S6E3HA2_GAMMA_CMD_CNT);
           ^~~~~~
   drivers/gpu/drm/panel/panel-samsung-s6e3ha2.c:439:2: note: Call to funct=
ion 'memcpy' is insecure as it does not provide security checks introduced =
in the C11 standard. Replace with analogous functions that support length a=
rguments or provides boundary checks such as 'memcpy_s' in case of C11
           memcpy(data + 1, gamma_tbl + index, S6E3HA2_GAMMA_CMD_CNT);
           ^~~~~~
   Suppressed 41 warnings (41 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   41 warnings generated.
   Suppressed 41 warnings (41 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   42 warnings generated.
>> drivers/gpu/drm/panel/panel-samsung-s6e63m0.c:755:3: warning: Value stor=
ed to 'ret' is never read [clang-analyzer-deadcode.DeadStores]
                   ret =3D devm_request_threaded_irq(dev, irq, NULL,
                   ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/panel/panel-samsung-s6e63m0.c:755:3: note: Value stored =
to 'ret' is never read
                   ret =3D devm_request_threaded_irq(dev, irq, NULL,
                   ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   Suppressed 41 warnings (41 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   41 warnings generated.
   Suppressed 41 warnings (41 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   41 warnings generated.
   Suppressed 41 warnings (41 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   114 warnings generated.
   drivers/staging/ks7010/ks_hostif.c:112:3: warning: Call to function 'mem=
set' is insecure as it does not provide security checks introduced in the C=
11 standard. Replace with analogous functions that support length arguments=
 or provides boundary checks such as 'memset_s' in case of C11 [clang-analy=
zer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   memset(ap, 0, sizeof(struct local_ap));
                   ^~~~~~
   drivers/staging/ks7010/ks_hostif.c:112:3: note: Call to function 'memset=
' is insecure as it does not provide security checks introduced in the C11 =
standard. Replace with analogous functions that support length arguments or=
 provides boundary checks such as 'memset_s' in case of C11
                   memset(ap, 0, sizeof(struct local_ap));
                   ^~~~~~
   drivers/staging/ks7010/ks_hostif.c:117:2: warning: Call to function 'mem=
cpy' is insecure as it does not provide security checks introduced in the C=
11 standard. Replace with analogous functions that support length arguments=
 or provides boundary checks such as 'memcpy_s' in case of C11 [clang-analy=
zer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memcpy(ap->ssid.body, priv->reg.ssid.body,
           ^~~~~~
   drivers/staging/ks7010/ks_hostif.c:117:2: note: Call to function 'memcpy=
' is insecure as it does not provide security checks introduced in the C11 =
standard. Replace with analogous functions that support length arguments or=
 provides boundary checks such as 'memcpy_s' in case of C11
           memcpy(ap->ssid.body, priv->reg.ssid.body,
           ^~~~~~
   drivers/staging/ks7010/ks_hostif.c:120:2: warning: Call to function 'mem=
cpy' is insecure as it does not provide security checks introduced in the C=
11 standard. Replace with analogous functions that support length arguments=
 or provides boundary checks such as 'memcpy_s' in case of C11 [clang-analy=
zer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memcpy(ap->rate_set.body, ap_info->rate_set.body,
           ^~~~~~
   drivers/staging/ks7010/ks_hostif.c:120:2: note: Call to function 'memcpy=
' is insecure as it does not provide security checks introduced in the C11 =
standard. Replace with analogous functions that support length arguments or=
 provides boundary checks such as 'memcpy_s' in case of C11
           memcpy(ap->rate_set.body, ap_info->rate_set.body,
           ^~~~~~
   drivers/staging/ks7010/ks_hostif.c:124:3: warning: Call to function 'mem=
cpy' is insecure as it does not provide security checks introduced in the C=
11 standard. Replace with analogous functions that support length arguments=
 or provides boundary checks such as 'memcpy_s' in case of C11 [clang-analy=
zer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   memcpy(&ap->rate_set.body[ap->rate_set.size],
                   ^~~~~~
   drivers/staging/ks7010/ks_hostif.c:124:3: note: Call to function 'memcpy=
' is insecure as it does not provide security checks introduced in the C11 =
standard. Replace with analogous functions that support length arguments or=
 provides boundary checks such as 'memcpy_s' in case of C11
                   memcpy(&ap->rate_set.body[ap->rate_set.size],
                   ^~~~~~
   drivers/staging/ks7010/ks_hostif.c:140:3: warning: Call to function 'mem=
cpy' is insecure as it does not provide security checks introduced in the C=
11 standard. Replace with analogous functions that support length arguments=
 or provides boundary checks such as 'memcpy_s' in case of C11 [clang-analy=
zer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   memcpy(ap->rsn_ie.body, ap_info->rsn.body, size);
                   ^~~~~~
   drivers/staging/ks7010/ks_hostif.c:140:3: note: Call to function 'memcpy=
' is insecure as it does not provide security checks introduced in the C11 =
standard. Replace with analogous functions that support length arguments or=
 provides boundary checks such as 'memcpy_s' in case of C11
                   memcpy(ap->rsn_ie.body, ap_info->rsn.body, size);
                   ^~~~~~
   drivers/staging/ks7010/ks_hostif.c:145:3: warning: Call to function 'mem=
cpy' is insecure as it does not provide security checks introduced in the C=
11 standard. Replace with analogous functions that support length arguments=
 or provides boundary checks such as 'memcpy_s' in case of C11 [clang-analy=
zer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   memcpy(ap->wpa_ie.body, ap_info->rsn.body, size);
                   ^~~~~~
   drivers/staging/ks7010/ks_hostif.c:145:3: note: Call to function 'memcpy=
' is insecure as it does not provide security checks introduced in the C11 =
standard. Replace with analogous functions that support length arguments or=
 provides boundary checks such as 'memcpy_s' in case of C11
                   memcpy(ap->wpa_ie.body, ap_info->rsn.body, size);
                   ^~~~~~
   drivers/staging/ks7010/ks_hostif.c:192:2: warning: Call to function 'mem=
cpy' is insecure as it does not provide security checks introduced in the C=
11 standard. Replace with analogous functions that support length arguments=
 or provides boundary checks such as 'memcpy_s' in case of C11 [clang-analy=
zer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memcpy(body, bp + 2, size);
           ^~~~~~
   drivers/staging/ks7010/ks_hostif.c:192:2: note: Call to function 'memcpy=
' is insecure as it does not provide security checks introduced in the C11 =
standard. Replace with analogous functions that support length arguments or=
 provides boundary checks such as 'memcpy_s' in case of C11
           memcpy(body, bp + 2, size);
           ^~~~~~
   drivers/staging/ks7010/ks_hostif.c:264:2: warning: Call to function 'mem=
set' is insecure as it does not provide security checks introduced in the C=
11 standard. Replace with analogous functions that support length arguments=
 or provides boundary checks such as 'memset_s' in case of C11 [clang-analy=
zer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memset(ap, 0, sizeof(struct local_ap));
           ^~~~~~
   drivers/staging/ks7010/ks_hostif.c:264:2: note: Call to function 'memset=
' is insecure as it does not provide security checks introduced in the C11 =
standard. Replace with analogous functions that support length arguments or=
 provides boundary checks such as 'memset_s' in case of C11
           memset(ap, 0, sizeof(struct local_ap));
           ^~~~~~
   drivers/staging/ks7010/ks_hostif.c:287:5: warning: Call to function 'mem=
cpy' is insecure as it does not provide security checks introduced in the C=
11 standard. Replace with analogous functions that support length arguments=
 or provides boundary checks such as 'memcpy_s' in case of C11 [clang-analy=
zer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                                   memcpy(&ap->rate_set.body[ap->rate_set.s=
ize],
                                   ^~~~~~
   drivers/staging/ks7010/ks_hostif.c:287:5: note: Call to function 'memcpy=
' is insecure as it does not provide security checks introduced in the C11 =
standard. Replace with analogous functions that support length arguments or=
 provides boundary checks such as 'memcpy_s' in case of C11
                                   memcpy(&ap->rate_set.body[ap->rate_set.s=
ize],
                                   ^~~~~~
   drivers/staging/ks7010/ks_hostif.c:291:5: warning: Call to function 'mem=
cpy' is insecure as it does not provide security checks introduced in the C=
11 standard. Replace with analogous functions that support length arguments=
 or provides boundary checks such as 'memcpy_s' in case of C11 [clang-analy=
zer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                                   memcpy(&ap->rate_set.body[ap->rate_set.s=
ize],
                                   ^~~~~~
   drivers/staging/ks7010/ks_hostif.c:291:5: note: Call to function 'memcpy=
' is insecure as it does not provide security checks introduced in the C11 =
standard. Replace with analogous functions that support length arguments or=
 provides boundary checks such as 'memcpy_s' in case of C11
                                   memcpy(&ap->rate_set.body[ap->rate_set.s=
ize],
                                   ^~~~~~
   drivers/staging/ks7010/ks_hostif.c:349:2: warning: Value stored to 'eth_=
proto' is never read [clang-analyzer-deadcode.DeadStores]
           eth_proto =3D ntohs(eth_hdr->h_proto);
           ^
   drivers/staging/ks7010/ks_hostif.c:349:2: note: Value stored to 'eth_pro=
to' is never read
   drivers/staging/ks7010/ks_hostif.c:368:3: warning: Call to function 'mem=
cpy' is insecure as it does not provide security checks introduced in the C=
11 standard. Replace with analogous functions that support length arguments=
 or provides boundary checks such as 'memcpy_s' in case of C11 [clang-analy=
zer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   memcpy(&recv_mic[0],
                   ^~~~~~
   drivers/staging/ks7010/ks_hostif.c:368:3: note: Call to function 'memcpy=
' is insecure as it does not provide security checks introduced in the C11 =
standard. Replace with analogous functions that support length arguments or=
 provides boundary checks such as 'memcpy_s' in case of C11
                   memcpy(&recv_mic[0],
                   ^~~~~~
   drivers/staging/ks7010/ks_hostif.c:400:4: warning: Call to function 'spr=
intf' is insecure as it does not provide bounding of the memory buffer or s=
ecurity checks introduced in the C11 standard. Replace with analogous funct=
ions that support length arguments or provides boundary checks such as 'spr=
intf_s' in case of C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUns=
afeBufferHandling]
                           sprintf(buf,
                           ^~~~~~~
   drivers/staging/ks7010/ks_hostif.c:400:4: note: Call to function 'sprint=
f' is insecure as it does not provide bounding of the memory buffer or secu=
rity checks introduced in the C11 standard. Replace with analogous function=
s that support length arguments or provides boundary checks such as 'sprint=
f_s' in case of C11
                           sprintf(buf,
                           ^~~~~~~
   drivers/staging/ks7010/ks_hostif.c:405:4: warning: Call to function 'mem=
set' is insecure as it does not provide security checks introduced in the C=
11 standard. Replace with analogous functions that support length arguments=
 or provides boundary checks such as 'memset_s' in case of C11 [clang-analy=
zer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                           memset(&wrqu, 0, sizeof(wrqu));
                           ^~~~~~
   drivers/staging/ks7010/ks_hostif.c:405:4: note: Call to function 'memset=
' is insecure as it does not provide security checks introduced in the C11 =
standard. Replace with analogous functions that support length arguments or=
 provides boundary checks such as 'memset_s' in case of C11
                           memset(&wrqu, 0, sizeof(wrqu));
                           ^~~~~~
   drivers/staging/ks7010/ks_hostif.c:549:3: warning: Call to function 'mem=
cpy' is insecure as it does not provide security checks introduced in the C=
11 standard. Replace with analogous functions that support length arguments=
 or provides boundary checks such as 'memcpy_s' in case of C11 [clang-analy=
zer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
                   memcpy(priv->firmware_version, priv->rxp, priv->rx_size);
                   ^~~~~~
   drivers/staging/ks7010/ks_hostif.c:549:3: note: Call to function 'memcpy=
' is insecure as it does not provide security checks introduced in the C11 =
standard. Replace with analogous functions that support length arguments or=
 provides boundary checks such as 'memcpy_s' in case of C11

vim +/ret +755 drivers/gpu/drm/panel/panel-samsung-s6e63m0.c

ed5a6c74c4dbf9 Linus Walleij    2020-11-17  705  =

c2a61865baa45b Linus Walleij    2021-06-14  706  int s6e63m0_probe(struct d=
evice *dev, void *trsp,
c2a61865baa45b Linus Walleij    2021-06-14  707  		  int (*dcs_read)(struct=
 device *dev, void *trsp, const u8 cmd, u8 *val),
c2a61865baa45b Linus Walleij    2021-06-14  708  		  int (*dcs_write)(struc=
t device *dev, void *trsp, const u8 *data, size_t len),
435e06c06cb2e3 Linus Walleij    2020-08-09  709  		  bool dsi_mode)
994a08a266e3e6 Pawe=C5=82 Chmiel     2019-02-22  710  {
994a08a266e3e6 Pawe=C5=82 Chmiel     2019-02-22  711  	struct s6e63m0 *ctx;
1f20bf5921de42 Linus Walleij    2020-12-14  712  	u32 max_brightness;
ed5a6c74c4dbf9 Linus Walleij    2020-11-17  713  	int irq;
994a08a266e3e6 Pawe=C5=82 Chmiel     2019-02-22  714  	int ret;
994a08a266e3e6 Pawe=C5=82 Chmiel     2019-02-22  715  =

994a08a266e3e6 Pawe=C5=82 Chmiel     2019-02-22  716  	ctx =3D devm_kzalloc=
(dev, sizeof(struct s6e63m0), GFP_KERNEL);
994a08a266e3e6 Pawe=C5=82 Chmiel     2019-02-22  717  	if (!ctx)
994a08a266e3e6 Pawe=C5=82 Chmiel     2019-02-22  718  		return -ENOMEM;
994a08a266e3e6 Pawe=C5=82 Chmiel     2019-02-22  719  =

c2a61865baa45b Linus Walleij    2021-06-14  720  	ctx->transport_data =3D t=
rsp;
47b1adc1d2a3b3 Linus Walleij    2020-12-05  721  	ctx->dsi_mode =3D dsi_mod=
e;
91867ac7d6724c Linus Walleij    2020-08-09  722  	ctx->dcs_read =3D dcs_rea=
d;
b7b23e4476872d Linus Walleij    2020-08-09  723  	ctx->dcs_write =3D dcs_wr=
ite;
b7b23e4476872d Linus Walleij    2020-08-09  724  	dev_set_drvdata(dev, ctx);
994a08a266e3e6 Pawe=C5=82 Chmiel     2019-02-22  725  =

994a08a266e3e6 Pawe=C5=82 Chmiel     2019-02-22  726  	ctx->dev =3D dev;
994a08a266e3e6 Pawe=C5=82 Chmiel     2019-02-22  727  	ctx->enabled =3D fal=
se;
994a08a266e3e6 Pawe=C5=82 Chmiel     2019-02-22  728  	ctx->prepared =3D fa=
lse;
994a08a266e3e6 Pawe=C5=82 Chmiel     2019-02-22  729  =

1f20bf5921de42 Linus Walleij    2020-12-14  730  	ret =3D device_property_r=
ead_u32(dev, "max-brightness", &max_brightness);
1f20bf5921de42 Linus Walleij    2020-12-14  731  	if (ret)
1f20bf5921de42 Linus Walleij    2020-12-14  732  		max_brightness =3D MAX_B=
RIGHTNESS;
1f20bf5921de42 Linus Walleij    2020-12-14  733  	if (max_brightness > MAX_=
BRIGHTNESS) {
1f20bf5921de42 Linus Walleij    2020-12-14  734  		dev_err(dev, "illegal ma=
x brightness specified\n");
1f20bf5921de42 Linus Walleij    2020-12-14  735  		max_brightness =3D MAX_B=
RIGHTNESS;
1f20bf5921de42 Linus Walleij    2020-12-14  736  	}
1f20bf5921de42 Linus Walleij    2020-12-14  737  =

994a08a266e3e6 Pawe=C5=82 Chmiel     2019-02-22  738  	ctx->supplies[0].sup=
ply =3D "vdd3";
994a08a266e3e6 Pawe=C5=82 Chmiel     2019-02-22  739  	ctx->supplies[1].sup=
ply =3D "vci";
994a08a266e3e6 Pawe=C5=82 Chmiel     2019-02-22  740  	ret =3D devm_regulat=
or_bulk_get(dev, ARRAY_SIZE(ctx->supplies),
994a08a266e3e6 Pawe=C5=82 Chmiel     2019-02-22  741  				      ctx->suppli=
es);
994a08a266e3e6 Pawe=C5=82 Chmiel     2019-02-22  742  	if (ret < 0) {
5936b3bdaa8889 Sam Ravnborg     2020-08-15  743  		dev_err(dev, "failed to =
get regulators: %d\n", ret);
994a08a266e3e6 Pawe=C5=82 Chmiel     2019-02-22  744  		return ret;
994a08a266e3e6 Pawe=C5=82 Chmiel     2019-02-22  745  	}
994a08a266e3e6 Pawe=C5=82 Chmiel     2019-02-22  746  =

994a08a266e3e6 Pawe=C5=82 Chmiel     2019-02-22  747  	ctx->reset_gpio =3D =
devm_gpiod_get(dev, "reset", GPIOD_OUT_HIGH);
994a08a266e3e6 Pawe=C5=82 Chmiel     2019-02-22  748  	if (IS_ERR(ctx->rese=
t_gpio)) {
5936b3bdaa8889 Sam Ravnborg     2020-08-15  749  		dev_err(dev, "cannot get=
 reset-gpios %ld\n", PTR_ERR(ctx->reset_gpio));
994a08a266e3e6 Pawe=C5=82 Chmiel     2019-02-22  750  		return PTR_ERR(ctx-=
>reset_gpio);
994a08a266e3e6 Pawe=C5=82 Chmiel     2019-02-22  751  	}
994a08a266e3e6 Pawe=C5=82 Chmiel     2019-02-22  752  =

ed5a6c74c4dbf9 Linus Walleij    2020-11-17  753  	irq =3D of_irq_get(dev->o=
f_node, 0);
ed5a6c74c4dbf9 Linus Walleij    2020-11-17  754  	if (irq) {
ed5a6c74c4dbf9 Linus Walleij    2020-11-17 @755  		ret =3D devm_request_thr=
eaded_irq(dev, irq, NULL,
ed5a6c74c4dbf9 Linus Walleij    2020-11-17  756  						s6e63m0_esd_irq, IRQ=
F_ONESHOT,
ed5a6c74c4dbf9 Linus Walleij    2020-11-17  757  						"s6e63m0-esd", ctx);
ed5a6c74c4dbf9 Linus Walleij    2020-11-17  758  	}
ed5a6c74c4dbf9 Linus Walleij    2020-11-17  759  =

9a2654c0f62a17 Laurent Pinchart 2019-09-04  760  	drm_panel_init(&ctx->pane=
l, dev, &s6e63m0_drm_funcs,
435e06c06cb2e3 Linus Walleij    2020-08-09  761  		       dsi_mode ? DRM_MO=
DE_CONNECTOR_DSI :
9a2654c0f62a17 Laurent Pinchart 2019-09-04  762  		       DRM_MODE_CONNECTO=
R_DPI);
994a08a266e3e6 Pawe=C5=82 Chmiel     2019-02-22  763  =

1f20bf5921de42 Linus Walleij    2020-12-14  764  	ret =3D s6e63m0_backlight=
_register(ctx, max_brightness);
994a08a266e3e6 Pawe=C5=82 Chmiel     2019-02-22  765  	if (ret < 0)
994a08a266e3e6 Pawe=C5=82 Chmiel     2019-02-22  766  		return ret;
994a08a266e3e6 Pawe=C5=82 Chmiel     2019-02-22  767  =

c3ee8c65f63799 Bernard Zhao     2020-08-01  768  	drm_panel_add(&ctx->panel=
);
c3ee8c65f63799 Bernard Zhao     2020-08-01  769  =

c3ee8c65f63799 Bernard Zhao     2020-08-01  770  	return 0;
994a08a266e3e6 Pawe=C5=82 Chmiel     2019-02-22  771  }
b7b23e4476872d Linus Walleij    2020-08-09  772  EXPORT_SYMBOL_GPL(s6e63m0_=
probe);
994a08a266e3e6 Pawe=C5=82 Chmiel     2019-02-22  773  =


-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============3483034627104805972==--

