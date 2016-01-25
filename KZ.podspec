Pod::Spec.new do |spec|
    spec.name = "KZ"
    spec.version = "1.0.0"
    spec.summary = "Framework base for iOS projects"
    spec.homepage = "http://kez.io"
    spec.license = { type: 'MIT', file: 'LICENSE' }
    spec.authors = { "Kesi Maduka" => 'me@kez.io' }
    spec.social_media_url = "https://twitter.com/k3zi_"

    spec.platform = :ios, "9.0"
    spec.requires_arc = true
    spec.source = { git: "https://github.com/k3zi/KZ.git", tag: "v#{spec.version}", submodules: true }
    spec.source_files = "KZ/**/*.{h,swift}"
end